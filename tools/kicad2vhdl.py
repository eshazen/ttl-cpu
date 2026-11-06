#!/usr/bin/env python3
"""Convert a KiCad XML netlist to structural VHDL using OpenCores TTLParts.vhd.

Named KiCad nets become top-level ports (except recognized supply nets).
Unnamed nets remain internal signals. Unconnected TTL inputs are mapped to
'U' and reported as warnings by default.

Example:
  python3 kicad2vhdl.py schematic.xml TTLParts.vhd -o schematic.vhd
"""

import argparse
import re
import sys
import xml.etree.ElementTree as ET


POWER_NET_VALUES = {
    "GND": "0", "0V": "0", "VSS": "0", "/GND": "0",
    "+5V": "1", "5V": "1", "VCC": "1", "VDD": "1",
    "+3V3": "1", "3V3": "1",
}


def vhdl_id(text):
    """Return a legal VHDL basic identifier."""
    text = re.sub(r"[^A-Za-z0-9_]", "_", str(text))
    text = re.sub(r"_+", "_", text).strip("_") or "unnamed"
    if text[0].isdigit():
        text = "n_" + text
    return text.lower()


def is_named_net(label):
    """True for intentional KiCad labels, false for auto-generated net names."""
    return bool(label) and not label.startswith("Net-(")


def unique_signal_names(nets):
    """Use readable labels where possible, ensuring case-insensitive uniqueness."""
    used = set()
    result = {}
    for code, net in nets.items():
        label = net.get("name", "")
        base = vhdl_id(label) if is_named_net(label) else "net_" + vhdl_id(code)
        candidate = base
        suffix = 2
        while candidate.lower() in used:
            candidate = f"{base}_{suffix}"
            suffix += 1
        used.add(candidate.lower())
        result[code] = candidate
    return result


def normalize_part(name):
    """Normalize 74LS00, 74LS00N and SN74LS00N to the same lookup key."""
    name = re.sub(r"[^A-Z0-9]", "", (name or "").upper())
    if name.startswith("SN"):
        name = name[2:]
    if name.endswith("N"):
        name = name[:-1]
    return name


def load_ttl_library(filename):
    """Extract entity names, X_n ports, directions and pin-comment functions."""
    with open(filename, "r", encoding="utf-8", errors="replace") as f:
        source = f.read()

    entity_re = re.compile(
        r"\bentity\s+(\w+)\s+is(.*?)\bend\s+entity(?:\s+\w+)?\s*;",
        re.IGNORECASE | re.DOTALL,
    )
    port_re = re.compile(r"\bport\s*\((.*?)\)\s*;", re.IGNORECASE | re.DOTALL)
    pin_re = re.compile(
        r"\bX_(\d+)\s*:\s*(?:(inout|in|out)\s+)?std_logic\b\s*;?\s*(?:--\s*([^\r\n]*))?",
        re.IGNORECASE,
    )

    devices = {}
    for em in entity_re.finditer(source):
        entity_name, body = em.group(1), em.group(2)
        pm = port_re.search(body)
        if not pm:
            continue
        pins = {}
        for m in pin_re.finditer(pm.group(1)):
            number, direction, comment = m.group(1), m.group(2), (m.group(3) or "").strip()
            pins[number] = {
                "port": f"X_{number}",
                "direction": (direction or "in").lower(),
                "function": comment,
            }
        if pins:
            devices[normalize_part(entity_name)] = {"entity": entity_name, "pins": pins}
    return devices


def parse_kicad_netlist(filename):
    root = ET.parse(filename).getroot()
    components, nets, pin_to_net, no_connect, node_types = {}, {}, {}, set(), {}

    for comp in root.findall("./components/comp"):
        ref = comp.get("ref")
        libsource = comp.find("libsource")
        components[ref] = {
            "ref": ref,
            "lib": libsource.get("lib", "") if libsource is not None else "",
            "part": libsource.get("part", "") if libsource is not None else "",
            "value": comp.findtext("value", default=""),
        }

    for net in root.findall("./nets/net"):
        code = net.get("code")
        nets[code] = {"code": code, "name": net.get("name", ""), "nodes": []}
        for node in net.findall("node"):
            ref, pin = node.get("ref"), node.get("pin")
            pintype = (node.get("pintype") or "").lower()
            nets[code]["nodes"].append((ref, pin))
            pin_to_net[(ref, pin)] = code
            node_types[(ref, pin)] = pintype

    for nc in root.findall(".//no_connects/no_connect"):
        no_connect.add((nc.get("ref"), nc.get("pin")))

    return components, nets, pin_to_net, no_connect, node_types


def power_function(function):
    """Classify a TTLParts pin comment as a supply pin, if applicable."""
    token = re.sub(r"[^A-Z0-9]", "", (function or "").upper())
    if token in {"GND", "GROUND", "VSS"}:
        return "gnd"
    if token in {"VCC", "VDD", "VCC1", "VCC2"}:
        return "vcc"
    return None


def infer_port_direction(code, net, node_types):
    """Infer top-level direction from the KiCad electrical pin types."""
    types = [node_types.get(node, "") for node in net["nodes"]]
    if any(t in {"output", "tri_state", "open_collector", "open_emitter"} for t in types):
        return "out"
    if any(t in {"bidirectional", "passive"} for t in types):
        return "inout"
    # A labelled net attached only to component inputs is an external input.
    return "in"


def generate_vhdl(components, nets, pin_to_net, no_connect, node_types,
                  devices, top, auto_power=True, strict_inputs=False,
                  expose_labels=True):
    lines, warnings, errors = [], [], []
    net_names = unique_signal_names(nets)
    power_net_values = {}
    top_ports = {}

    for code, net in nets.items():
        label = net.get("name", "")
        if label.upper() in POWER_NET_VALUES:
            power_net_values[code] = POWER_NET_VALUES[label.upper()]
        elif expose_labels and is_named_net(label):
            top_ports[code] = infer_port_direction(code, net, node_types)

    # Entity declaration. Named nets are ports; all other nets are internal.
    lines += [
        "-- Generated from KiCad XML using OpenCores TTLParts.vhd",
        "-- Named KiCad nets are exposed as top-level ports.",
        "-- Unconnected TTL inputs are represented by 'U' and reported.",
        "",
        "library ieee;",
        "use ieee.std_logic_1164.all;",
        "",
        f"entity {vhdl_id(top)} is",
    ]

    if top_ports:
        lines.append("    port (")
        declarations = []
        for code, direction in top_ports.items():
            declarations.append(f"        {net_names[code]} : {direction} std_logic")
        lines.append(";\n".join(declarations))
        lines.append("    );")
    lines += ["end entity;", "", f"architecture structural of {vhdl_id(top)} is", ""]

    for code, net in nets.items():
        if code in top_ports:
            continue
        lines.append(f"    signal {net_names[code]} : std_logic; -- KiCad net: {net['name']}")

    # Find whether unconnected power pins require fallback supply signals.
    has_fallback_gnd = has_fallback_vcc = False
    for ref, comp in components.items():
        key = normalize_part(comp["part"]) or normalize_part(comp["value"])
        dev = devices.get(key)
        if not dev:
            continue
        for pin, info in dev["pins"].items():
            if (ref, pin) not in pin_to_net and (ref, pin) not in no_connect:
                pf = power_function(info["function"])
                if auto_power and pf == "gnd":
                    has_fallback_gnd = True
                elif auto_power and pf == "vcc":
                    has_fallback_vcc = True

    if has_fallback_gnd:
        lines.append("    signal gnd : std_logic;")
    if has_fallback_vcc:
        lines.append("    signal vcc : std_logic;")

    lines += ["", "begin", ""]

    if has_fallback_gnd:
        lines.append("    gnd <= '0';")
    if has_fallback_vcc:
        lines.append("    vcc <= '1';")
    for code, value in power_net_values.items():
        lines.append(f"    {net_names[code]} <= '{value}';")
    if has_fallback_gnd or has_fallback_vcc or power_net_values:
        lines.append("")

    # One instance per physical KiCad component, not per schematic unit.
    for ref, comp in components.items():
        key = normalize_part(comp["part"]) or normalize_part(comp["value"])
        dev = devices.get(key)
        if not dev:
            if comp["lib"] == "74xx" or normalize_part(comp["value"]).startswith("74"):
                warnings.append(f"{ref}: no matching TTLParts.vhd entity for {comp['part'] or comp['value']}")
            continue

        lines.append(f"    -- {ref}: {comp['value']} -> {dev['entity']}")
        lines.append(f"    {vhdl_id(ref)} : entity work.{dev['entity']}")
        lines.append("        port map (")
        associations = []

        for pin in sorted(dev["pins"], key=int):
            info = dev["pins"][pin]
            port, direction = info["port"], info["direction"]
            node = (ref, pin)

            if node in pin_to_net:
                code = pin_to_net[node]
                expr = net_names[code]
            elif node in no_connect:
                pf = power_function(info["function"])
                if auto_power and pf:
                    expr = pf
                elif direction == "in":
                    expr = "'U'"
                    warnings.append(f"{ref} pin {pin}: explicitly no-connect input ({info['function'] or port})")
                else:
                    expr = "open"
            else:
                pf = power_function(info["function"])
                if auto_power and pf:
                    expr = pf
                elif direction == "in":
                    expr = "'U'"
                    msg = f"{ref} pin {pin}: unconnected input ({info['function'] or port})"
                    (errors if strict_inputs else warnings).append(msg)
                else:
                    expr = "open"
                    if direction == "inout":
                        warnings.append(f"{ref} pin {pin}: unconnected inout ({info['function'] or port})")

            associations.append(f"            {port} => {expr}")

        lines.append(",\n".join(associations))
        lines.append("        );")
        lines.append("")

    lines += ["end architecture structural;", ""]
    if errors:
        raise ValueError("Unconnected TTL inputs (strict mode):\n" + "\n".join(errors))
    return "\n".join(lines), warnings, top_ports


def main():
    ap = argparse.ArgumentParser(description="KiCad XML to OpenCores TTL structural VHDL")
    ap.add_argument("netlist", help="KiCad XML netlist")
    ap.add_argument("ttlparts", help="OpenCores TTLParts.vhd")
    ap.add_argument("-o", "--output", default="netlist.vhd")
    ap.add_argument("-t", "--top", default="schematic")
    ap.add_argument("--no-auto-power", action="store_true",
                    help="Do not automatically tie absent GND/VCC pins to logic 0/1")
    ap.add_argument("--strict-inputs", action="store_true",
                    help="Exit with an error if a TTL input is unconnected")
    ap.add_argument("--no-label-ports", action="store_true",
                    help="Keep named KiCad nets internal instead of making top-level ports")
    args = ap.parse_args()

    try:
        devices = load_ttl_library(args.ttlparts)
        components, nets, pin_to_net, no_connect, node_types = parse_kicad_netlist(args.netlist)
        vhdl, warnings, top_ports = generate_vhdl(
            components, nets, pin_to_net, no_connect, node_types,
            devices, args.top,
            auto_power=not args.no_auto_power,
            strict_inputs=args.strict_inputs,
            expose_labels=not args.no_label_ports,
        )
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(vhdl)

        matched = sum(
            1 for c in components.values()
            if (normalize_part(c["part"]) or normalize_part(c["value"])) in devices
        )
        print(f"TTL entities parsed: {len(devices)}")
        print(f"KiCad components:    {len(components)}")
        print(f"TTL instances:       {matched}")
        print(f"KiCad nets:          {len(nets)}")
        print(f"Top-level ports:     {len(top_ports)}")
        print(f"Wrote:               {args.output}")
        if top_ports:
            print("\nTop-level ports:")
            for code, direction in top_ports.items():
                print(f"  {net_names_for_report(nets[code]['name'], code)}: {direction}")
        if warnings:
            print("\nWarnings:")
            for warning in warnings:
                print("  WARNING:", warning)
    except (OSError, ET.ParseError, ValueError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        sys.exit(1)


def net_names_for_report(label, code):
    return vhdl_id(label) if is_named_net(label) else "net_" + vhdl_id(code)


if __name__ == "__main__":
    main()
