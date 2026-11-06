-- --------------------------------------------------------------------
-- Date: 2026-11-05T07:13:47
-- --------------------------------------------------------------------
-- Tool: "Eeschema 10.0.3
-- --------------------------------------------------------------------
-- File: /Users/ehazen/work/ttl-cpu/tools/CPU.kicad_sch
-- --------------------------------------------------------------------
-- Interfaces:
--      - Wishbone B4 complaint
--      - Altera Avalon Interface complaint
--
-- Module implements:
--      -
--      -
-- --------------------------------------------------------------------
-- Author:
--      PhD. Esteve Farres Berenguer
--      C / Can Planes, 6
--      ES17160 - Anglès - Girona
--      Catalonia - Spain
--
-- Contact:
--      mobile: +34 659 17 59 69
--      web: https://plus.google.com/+EsteveFarresBerenguer/posts
--      email: esteve.farres@gmail.com
--
-- --------------------------------------------------------------------
-- Code Revision History :
--      -
-- --------------------------------------------------------------------
-- Ver: | Author |Mod. Date   |Changes Made:
-- V1.0 | E.F.B. | YYYY/MM/DD | Initial ver
-- --------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity /Users/ehazen/work/ttl-cpu/tools/CPU.kicad_sch is
    port (
    );

architecture rtl of /Users/ehazen/work/ttl-cpu/tools/CPU.kicad_sch is

    -- Components 

    component my_74LS682_1 is 
    port(
        signal ~{P>Q} : out std_logic;
        signal P0 : in std_logic;
        signal Q0 : in std_logic;
        signal P1 : in std_logic;
        signal Q1 : in std_logic;
        signal P2 : in std_logic;
        signal Q2 : in std_logic;
        signal P3 : in std_logic;
        signal Q3 : in std_logic;
        signal GND : in std_logic;
        signal P4 : in std_logic;
        signal Q4 : in std_logic;
        signal P5 : in std_logic;
        signal Q5 : in std_logic;
        signal P6 : in std_logic;
        signal Q6 : in std_logic;
        signal P7 : in std_logic;
        signal Q7 : in std_logic;
        signal VCC : in std_logic;
    );

    component 74LS00 is 
    port(
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal GND : ?std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS02 is 
    port(
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal GND : ?std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS163 is 
    port(
        signal ~{MR} : in std_logic;
        signal CP : in std_logic;
        signal D0 : in std_logic;
        signal D1 : in std_logic;
        signal D2 : in std_logic;
        signal D3 : in std_logic;
        signal CEP : in std_logic;
        signal GND : ?std_logic;
        signal ~{PE} : in std_logic;
        signal CET : in std_logic;
        signal Q3 : out std_logic;
        signal Q2 : out std_logic;
        signal Q1 : out std_logic;
        signal Q0 : out std_logic;
        signal TC : out std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS181 is 
    port(
        signal B0 : in std_logic;
        signal A0 : in std_logic;
        signal S3 : in std_logic;
        signal S2 : in std_logic;
        signal S1 : in std_logic;
        signal S0 : in std_logic;
        signal Cn : in std_logic;
        signal M : in std_logic;
        signal F0 : out std_logic;
        signal F1 : out std_logic;
        signal F2 : out std_logic;
        signal GND : ?std_logic;
        signal F3 : out std_logic;
        signal A=B : out std_logic;
        signal X : out std_logic;
        signal Cn+4 : out std_logic;
        signal Y : out std_logic;
        signal B3 : in std_logic;
        signal A3 : in std_logic;
        signal B2 : in std_logic;
        signal A2 : in std_logic;
        signal B1 : in std_logic;
        signal A1 : in std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS182 is 
    port(
        signal G1 : in std_logic;
        signal P1 : in std_logic;
        signal G0 : in std_logic;
        signal P0 : in std_logic;
        signal G3 : in std_logic;
        signal P3 : in std_logic;
        signal P : out std_logic;
        signal GND : ?std_logic;
        signal Cn+z : out std_logic;
        signal G : out std_logic;
        signal Cn+y : out std_logic;
        signal Cn+x : out std_logic;
        signal Cn : in std_logic;
        signal G2 : in std_logic;
        signal P2 : in std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS20 is 
    port(
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal GND : ?std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS244 is 
    port(
        signal OEa : in std_logic;
        signal I0a : in std_logic;
        signal O3b : ?std_logic;
        signal I1a : in std_logic;
        signal O2b : ?std_logic;
        signal I2a : in std_logic;
        signal O1b : ?std_logic;
        signal I3a : in std_logic;
        signal O0b : ?std_logic;
        signal GND : ?std_logic;
        signal I0b : in std_logic;
        signal O3a : ?std_logic;
        signal I1b : in std_logic;
        signal O2a : ?std_logic;
        signal I2b : in std_logic;
        signal O1a : ?std_logic;
        signal I3b : in std_logic;
        signal O0a : ?std_logic;
        signal OEb : in std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS377 is 
    port(
        signal ~{E} : in std_logic;
        signal Q0 : out std_logic;
        signal D0 : in std_logic;
        signal D1 : in std_logic;
        signal Q1 : out std_logic;
        signal Q2 : out std_logic;
        signal D2 : in std_logic;
        signal D3 : in std_logic;
        signal Q3 : out std_logic;
        signal GND : ?std_logic;
        signal CP : in std_logic;
        signal Q4 : out std_logic;
        signal D4 : in std_logic;
        signal D5 : in std_logic;
        signal Q5 : out std_logic;
        signal Q6 : out std_logic;
        signal D6 : in std_logic;
        signal D7 : in std_logic;
        signal Q7 : out std_logic;
        signal VCC : ?std_logic;
    );

    component 74LS86 is 
    port(
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal GND : ?std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal  : out std_logic;
        signal  : in std_logic;
        signal  : in std_logic;
        signal VCC : ?std_logic;
    );

    component KM62256CLP is 
    port(
        signal A14 : in std_logic;
        signal A12 : in std_logic;
        signal A7 : in std_logic;
        signal A6 : in std_logic;
        signal A5 : in std_logic;
        signal A4 : in std_logic;
        signal A3 : in std_logic;
        signal A2 : in std_logic;
        signal A1 : in std_logic;
        signal A0 : in std_logic;
        signal Q0 : ?std_logic;
        signal Q1 : ?std_logic;
        signal Q2 : ?std_logic;
        signal GND : ?std_logic;
        signal Q3 : ?std_logic;
        signal Q4 : ?std_logic;
        signal Q5 : ?std_logic;
        signal Q6 : ?std_logic;
        signal Q7 : ?std_logic;
        signal ~{CS} : in std_logic;
        signal A10 : in std_logic;
        signal ~{OE} : in std_logic;
        signal A11 : in std_logic;
        signal A9 : in std_logic;
        signal A8 : in std_logic;
        signal A13 : in std_logic;
        signal ~{WE} : in std_logic;
        signal VCC : ?std_logic;
    );

    component my_74LS682 is 
    port(
        signal ~{P>Q} : out std_logic;
        signal P0 : in std_logic;
        signal Q0 : in std_logic;
        signal P1 : in std_logic;
        signal Q1 : in std_logic;
        signal P2 : in std_logic;
        signal Q2 : in std_logic;
        signal P3 : in std_logic;
        signal Q3 : in std_logic;
        signal GND : in std_logic;
        signal P4 : in std_logic;
        signal Q4 : in std_logic;
        signal P5 : in std_logic;
        signal Q5 : in std_logic;
        signal P6 : in std_logic;
        signal Q6 : in std_logic;
        signal P7 : in std_logic;
        signal Q7 : in std_logic;
        signal VCC : in std_logic;
    );

    -- Signals 
    signal /A/D0 : std_logic;
    signal /A/D1 : std_logic;
    signal /A/D2 : std_logic;
    signal /A/D3 : std_logic;
    signal /A/D4 : std_logic;
    signal /A/D5 : std_logic;
    signal /A/D6 : std_logic;
    signal /A/D7 : std_logic;
    signal /A/D8 : std_logic;
    signal /A/D9 : std_logic;
    signal /A/D10 : std_logic;
    signal /A/D11 : std_logic;
    signal /A/D12 : std_logic;
    signal /A/D13 : std_logic;
    signal /A/D14 : std_logic;
    signal /A/D15 : std_logic;
    signal /A/Q0 : std_logic;
    signal /A/Q1 : std_logic;
    signal /A/Q2 : std_logic;
    signal /A/Q3 : std_logic;
    signal /A/Q4 : std_logic;
    signal /A/Q5 : std_logic;
    signal /A/Q6 : std_logic;
    signal /A/Q7 : std_logic;
    signal /A/Q8 : std_logic;
    signal /A/Q9 : std_logic;
    signal /A/Q10 : std_logic;
    signal /A/Q11 : std_logic;
    signal /A/Q12 : std_logic;
    signal /A/Q13 : std_logic;
    signal /A/Q14 : std_logic;
    signal /A/Q15 : std_logic;
    signal /ALU/A0 : std_logic;
    signal /ALU/A1 : std_logic;
    signal /ALU/A2 : std_logic;
    signal /ALU/A3 : std_logic;
    signal /ALU/A4 : std_logic;
    signal /ALU/A5 : std_logic;
    signal /ALU/A6 : std_logic;
    signal /ALU/A7 : std_logic;
    signal /ALU/A8 : std_logic;
    signal /ALU/A9 : std_logic;
    signal /ALU/A10 : std_logic;
    signal /ALU/A11 : std_logic;
    signal /ALU/A12 : std_logic;
    signal /ALU/A13 : std_logic;
    signal /ALU/A14 : std_logic;
    signal /ALU/A15 : std_logic;
    signal /ALU/CN+X : std_logic;
    signal /ALU/CN+Y : std_logic;
    signal /ALU/CN+Z : std_logic;
    signal /ALU/EQ0 : std_logic;
    signal /ALU/EQ1 : std_logic;
    signal /ALU/EQ2 : std_logic;
    signal /ALU/EQ3 : std_logic;
    signal /ALU/EQH : std_logic;
    signal /ALU/EQL : std_logic;
    signal /ALU/F0 : std_logic;
    signal /ALU/F1 : std_logic;
    signal /ALU/F2 : std_logic;
    signal /ALU/F3 : std_logic;
    signal /ALU/F4 : std_logic;
    signal /ALU/F5 : std_logic;
    signal /ALU/F6 : std_logic;
    signal /ALU/F7 : std_logic;
    signal /ALU/F8 : std_logic;
    signal /ALU/F9 : std_logic;
    signal /ALU/F10 : std_logic;
    signal /ALU/F11 : std_logic;
    signal /ALU/F12 : std_logic;
    signal /ALU/F13 : std_logic;
    signal /ALU/F14 : std_logic;
    signal /ALU/F15 : std_logic;
    signal /ALU/G : std_logic;
    signal /ALU/P : std_logic;
    signal /ALU_EQ : std_logic;
    signal /ALU_OF : std_logic;
    signal /ALU_S0 : std_logic;
    signal /ALU_S1 : std_logic;
    signal /ALU_S2 : std_logic;
    signal /ALU_S3 : std_logic;
    signal /ALU_Z : std_logic;
    signal /IR/Q0 : std_logic;
    signal /IR/Q1 : std_logic;
    signal /IR/Q2 : std_logic;
    signal /IR/Q3 : std_logic;
    signal /IR/Q4 : std_logic;
    signal /IR/Q5 : std_logic;
    signal /IR/Q6 : std_logic;
    signal /IR/Q7 : std_logic;
    signal /IR/Q8 : std_logic;
    signal /IR/Q9 : std_logic;
    signal /IR/Q10 : std_logic;
    signal /IR/Q11 : std_logic;
    signal /IR/Q12 : std_logic;
    signal /IR/Q13 : std_logic;
    signal /IR/Q14 : std_logic;
    signal /IR/Q15 : std_logic;
    signal /MAR/Q0 : std_logic;
    signal /MAR/Q1 : std_logic;
    signal /MAR/Q2 : std_logic;
    signal /MAR/Q3 : std_logic;
    signal /MAR/Q4 : std_logic;
    signal /MAR/Q5 : std_logic;
    signal /MAR/Q6 : std_logic;
    signal /MAR/Q7 : std_logic;
    signal /MAR/Q8 : std_logic;
    signal /MAR/Q9 : std_logic;
    signal /MAR/Q10 : std_logic;
    signal /MAR/Q11 : std_logic;
    signal /MAR/Q12 : std_logic;
    signal /MAR/Q13 : std_logic;
    signal /MAR/Q14 : std_logic;
    signal /MAR/Q15 : std_logic;
    signal /MODE : std_logic;
    signal /~{ALU2B} : std_logic;
    signal /~{ALU_CIN} : std_logic;
    signal /~{ALU_EN} : std_logic;
    signal /~{ALU_OE} : std_logic;
    signal /~{A_EN} : std_logic;
    signal /~{B_EN} : std_logic;
    signal /~{B_OE} : std_logic;
    signal /~{C_EN} : std_logic;
    signal /~{C_OE} : std_logic;
    signal /~{IR_EN} : std_logic;
    signal /~{IR_OE} : std_logic;
    signal /~{MAR_EN} : std_logic;
    signal /~{PC_INC} : std_logic;
    signal /~{PC_LD} : std_logic;
    signal /~{PC_OE} : std_logic;
    signal /~{RAM_OE} : std_logic;
    signal /~{RAM_WE} : std_logic;
    signal CLK : std_logic;
    signal GND : std_logic;
    signal Net-(U1-CET) : std_logic;
    signal Net-(U1-Q0) : std_logic;
    signal Net-(U1-Q1) : std_logic;
    signal Net-(U1-Q2) : std_logic;
    signal Net-(U1-Q3) : std_logic;
    signal Net-(U2-I0a) : std_logic;
    signal Net-(U2-I1a) : std_logic;
    signal Net-(U2-I2a) : std_logic;
    signal Net-(U2-I3a) : std_logic;
    signal Net-(U3-CET) : std_logic;
    signal Net-(U4-CET) : std_logic;
    signal Net-(U4-Q0) : std_logic;
    signal Net-(U4-Q1) : std_logic;
    signal Net-(U4-Q2) : std_logic;
    signal Net-(U4-Q3) : std_logic;
    signal Net-(U5-I0a) : std_logic;
    signal Net-(U5-I1a) : std_logic;
    signal Net-(U5-I2a) : std_logic;
    signal Net-(U5-I3a) : std_logic;
    signal Net-(U7-Q2) : std_logic;
    signal Net-(U7-Q3) : std_logic;
    signal Net-(U7-Q4) : std_logic;
    signal Net-(U7-Q5) : std_logic;
    signal Net-(U7-Q6) : std_logic;
    signal Net-(U7-Q7) : std_logic;
    signal Net-(U10-I0a) : std_logic;
    signal Net-(U10-I0b) : std_logic;
    signal Net-(U10-I1a) : std_logic;
    signal Net-(U10-I1b) : std_logic;
    signal Net-(U10-I2a) : std_logic;
    signal Net-(U10-I2b) : std_logic;
    signal Net-(U10-I3a) : std_logic;
    signal Net-(U10-I3b) : std_logic;
    signal Net-(U11-Q2) : std_logic;
    signal Net-(U11-Q3) : std_logic;
    signal Net-(U11-Q4) : std_logic;
    signal Net-(U11-Q5) : std_logic;
    signal Net-(U11-Q6) : std_logic;
    signal Net-(U11-Q7) : std_logic;
    signal Net-(U12-Q0) : std_logic;
    signal Net-(U12-Q1) : std_logic;
    signal Net-(U12-Q2) : std_logic;
    signal Net-(U12-Q3) : std_logic;
    signal Net-(U12-Q4) : std_logic;
    signal Net-(U12-Q5) : std_logic;
    signal Net-(U12-Q6) : std_logic;
    signal Net-(U12-Q7) : std_logic;
    signal Net-(U15-Q2) : std_logic;
    signal Net-(U15-Q3) : std_logic;
    signal Net-(U15-Q4) : std_logic;
    signal Net-(U15-Q5) : std_logic;
    signal Net-(U15-Q6) : std_logic;
    signal Net-(U15-Q7) : std_logic;
    signal Net-(U16-Q0) : std_logic;
    signal Net-(U16-Q1) : std_logic;
    signal Net-(U16-Q2) : std_logic;
    signal Net-(U16-Q3) : std_logic;
    signal Net-(U16-Q4) : std_logic;
    signal Net-(U16-Q5) : std_logic;
    signal Net-(U16-Q6) : std_logic;
    signal Net-(U16-Q7) : std_logic;
    signal Net-(U19-X) : std_logic;
    signal Net-(U19-Y) : std_logic;
    signal Net-(U20-X) : std_logic;
    signal Net-(U20-Y) : std_logic;
    signal Net-(U21-X) : std_logic;
    signal Net-(U21-Y) : std_logic;
    signal Net-(U22-X) : std_logic;
    signal Net-(U22-Y) : std_logic;
    signal Net-(U24-Pad3) : std_logic;
    signal Net-(U24-Pad4) : std_logic;
    signal Net-(U24-Pad5) : std_logic;
    signal Net-(U35-Q2) : std_logic;
    signal Net-(U35-Q3) : std_logic;
    signal Net-(U35-Q4) : std_logic;
    signal Net-(U35-Q5) : std_logic;
    signal Net-(U35-Q6) : std_logic;
    signal Net-(U35-Q7) : std_logic;
    signal Net-(U36-Q0) : std_logic;
    signal Net-(U36-Q1) : std_logic;
    signal Net-(U36-Q2) : std_logic;
    signal Net-(U36-Q3) : std_logic;
    signal Net-(U36-Q4) : std_logic;
    signal Net-(U36-Q5) : std_logic;
    signal Net-(U36-Q6) : std_logic;
    signal Net-(U36-Q7) : std_logic;
    signal Net-(U39-Q2) : std_logic;
    signal Net-(U39-Q3) : std_logic;
    signal Net-(U39-Q4) : std_logic;
    signal Net-(U39-Q5) : std_logic;
    signal Net-(U39-Q6) : std_logic;
    signal Net-(U39-Q7) : std_logic;
    signal Net-(U40-Q0) : std_logic;
    signal Net-(U40-Q1) : std_logic;
    signal Net-(U40-Q2) : std_logic;
    signal Net-(U40-Q3) : std_logic;
    signal Net-(U40-Q4) : std_logic;
    signal Net-(U40-Q5) : std_logic;
    signal Net-(U40-Q6) : std_logic;
    signal Net-(U40-Q7) : std_logic;
    signal VCC : std_logic;
    signal unconnected-(U1-TC-Pad15) : std_logic;
    signal unconnected-(U7-Q0-Pad2) : std_logic;
    signal unconnected-(U7-Q1-Pad5) : std_logic;
    signal unconnected-(U9-I0a-Pad2) : std_logic;
    signal unconnected-(U9-I1a-Pad4) : std_logic;
    signal unconnected-(U11-Q0-Pad2) : std_logic;
    signal unconnected-(U11-Q1-Pad5) : std_logic;
    signal unconnected-(U13-I0a-Pad2) : std_logic;
    signal unconnected-(U13-I1a-Pad4) : std_logic;
    signal unconnected-(U15-Q0-Pad2) : std_logic;
    signal unconnected-(U15-Q1-Pad5) : std_logic;
    signal unconnected-(U17-I0a-Pad2) : std_logic;
    signal unconnected-(U17-I1a-Pad4) : std_logic;
    signal unconnected-(U19-Cn+4-Pad16) : std_logic;
    signal unconnected-(U20-Cn+4-Pad16) : std_logic;
    signal unconnected-(U21-Cn+4-Pad16) : std_logic;
    signal unconnected-(U22-Cn+4-Pad16) : std_logic;
    signal unconnected-(U29-Pad5) : std_logic;
    signal unconnected-(U31-~{P>Q}-Pad1) : std_logic;
    signal unconnected-(U32-~{P>Q}-Pad1) : std_logic;
    signal unconnected-(U35-Q0-Pad2) : std_logic;
    signal unconnected-(U35-Q1-Pad5) : std_logic;
    signal unconnected-(U37-I0a-Pad2) : std_logic;
    signal unconnected-(U37-I1a-Pad4) : std_logic;
    signal unconnected-(U39-Q0-Pad2) : std_logic;
    signal unconnected-(U39-Q1-Pad5) : std_logic;
    signal unconnected-(U41-I0a-Pad2) : std_logic;
    signal unconnected-(U41-I1a-Pad4) : std_logic;
    signal unconnected-(U45-GND-Pad10) : std_logic;
    signal unconnected-(U45-VCC-Pad20) : std_logic;
    signal unconnected-(U46-GND-Pad10) : std_logic;
    signal unconnected-(U46-Q7-Pad19) : std_logic;
    signal unconnected-(U46-VCC-Pad20) : std_logic;


begin
    -- Instances 
    U1 : component 74LS163
    port map(
        D0 => /A/D12, 
        D1 => /A/D13, 
        D2 => /A/D14, 
        D3 => /A/D15, 
        CEP => /~{PC_INC}, 
        ~{PE} => /~{PC_LD}, 
        CP => CLK, 
        GND => GND, 
        CET => Net-(U1-CET), 
        Q0 => Net-(U1-Q0), 
        Q1 => Net-(U1-Q1), 
        Q2 => Net-(U1-Q2), 
        Q3 => Net-(U1-Q3), 
        ~{MR} => VCC, 
        VCC => VCC, 
        TC => unconnected-(U1-TC-Pad15), 
        );


    U2 : component 74LS244
    port map(
        O0a => /ALU/A8, 
        O1a => /ALU/A9, 
        O2a => /ALU/A10, 
        O3a => /ALU/A11, 
        O0b => /ALU/A12, 
        O1b => /ALU/A13, 
        O2b => /ALU/A14, 
        O3b => /ALU/A15, 
        OEa => /~{PC_OE}, 
        OEb => /~{PC_OE}, 
        GND => GND, 
        I0b => Net-(U1-Q0), 
        I1b => Net-(U1-Q1), 
        I2b => Net-(U1-Q2), 
        I3b => Net-(U1-Q3), 
        I0a => Net-(U2-I0a), 
        I1a => Net-(U2-I1a), 
        I2a => Net-(U2-I2a), 
        I3a => Net-(U2-I3a), 
        VCC => VCC, 
        );


    U3 : component 74LS163
    port map(
        D0 => /A/D8, 
        D1 => /A/D9, 
        D2 => /A/D10, 
        D3 => /A/D11, 
        CEP => /~{PC_INC}, 
        ~{PE} => /~{PC_LD}, 
        CP => CLK, 
        GND => GND, 
        TC => Net-(U1-CET), 
        Q0 => Net-(U2-I0a), 
        Q1 => Net-(U2-I1a), 
        Q2 => Net-(U2-I2a), 
        Q3 => Net-(U2-I3a), 
        CET => Net-(U3-CET), 
        ~{MR} => VCC, 
        VCC => VCC, 
        );


    U4 : component 74LS163
    port map(
        D0 => /A/D4, 
        D1 => /A/D5, 
        D2 => /A/D6, 
        D3 => /A/D7, 
        CEP => /~{PC_INC}, 
        ~{PE} => /~{PC_LD}, 
        CP => CLK, 
        GND => GND, 
        TC => Net-(U3-CET), 
        CET => Net-(U4-CET), 
        Q0 => Net-(U4-Q0), 
        Q1 => Net-(U4-Q1), 
        Q2 => Net-(U4-Q2), 
        Q3 => Net-(U4-Q3), 
        ~{MR} => VCC, 
        VCC => VCC, 
        );


    U5 : component 74LS244
    port map(
        O0a => /ALU/A0, 
        O1a => /ALU/A1, 
        O2a => /ALU/A2, 
        O3a => /ALU/A3, 
        O0b => /ALU/A4, 
        O1b => /ALU/A5, 
        O2b => /ALU/A6, 
        O3b => /ALU/A7, 
        OEa => /~{PC_OE}, 
        OEb => /~{PC_OE}, 
        GND => GND, 
        I0b => Net-(U4-Q0), 
        I1b => Net-(U4-Q1), 
        I2b => Net-(U4-Q2), 
        I3b => Net-(U4-Q3), 
        I0a => Net-(U5-I0a), 
        I1a => Net-(U5-I1a), 
        I2a => Net-(U5-I2a), 
        I3a => Net-(U5-I3a), 
        VCC => VCC, 
        );


    U6 : component 74LS163
    port map(
        D0 => /A/D0, 
        D1 => /A/D1, 
        D2 => /A/D2, 
        D3 => /A/D3, 
        CET => /~{PC_INC}, 
        CEP => /~{PC_INC}, 
        ~{PE} => /~{PC_LD}, 
        CP => CLK, 
        GND => GND, 
        TC => Net-(U4-CET), 
        Q0 => Net-(U5-I0a), 
        Q1 => Net-(U5-I1a), 
        Q2 => Net-(U5-I2a), 
        Q3 => Net-(U5-I3a), 
        ~{MR} => VCC, 
        VCC => VCC, 
        );


    U7 : component 74LS377
    port map(
        D0 => /A/D0, 
        D1 => /A/D1, 
        D2 => /A/D2, 
        D3 => /A/D3, 
        D4 => /A/D4, 
        D5 => /A/D5, 
        D6 => /A/D6, 
        D7 => /A/D7, 
        ~{E} => /~{MAR_EN}, 
        CP => CLK, 
        GND => GND, 
        Q2 => Net-(U7-Q2), 
        Q3 => Net-(U7-Q3), 
        Q4 => Net-(U7-Q4), 
        Q5 => Net-(U7-Q5), 
        Q6 => Net-(U7-Q6), 
        Q7 => Net-(U7-Q7), 
        VCC => VCC, 
        Q0 => unconnected-(U7-Q0-Pad2), 
        Q1 => unconnected-(U7-Q1-Pad5), 
        );


    U8 : component 74LS377
    port map(
        D0 => /A/D8, 
        D1 => /A/D9, 
        D2 => /A/D10, 
        D3 => /A/D11, 
        D4 => /A/D12, 
        D5 => /A/D13, 
        D6 => /A/D14, 
        D7 => /A/D15, 
        ~{E} => /~{MAR_EN}, 
        CP => CLK, 
        GND => GND, 
        Q0 => Net-(U10-I0a), 
        Q4 => Net-(U10-I0b), 
        Q1 => Net-(U10-I1a), 
        Q5 => Net-(U10-I1b), 
        Q2 => Net-(U10-I2a), 
        Q6 => Net-(U10-I2b), 
        Q3 => Net-(U10-I3a), 
        Q7 => Net-(U10-I3b), 
        VCC => VCC, 
        );


    U9 : component 74LS244
    port map(
        O0a => /MAR/Q0, 
        O1a => /MAR/Q1, 
        O2a => /MAR/Q2, 
        O3a => /MAR/Q3, 
        O0b => /MAR/Q4, 
        O1b => /MAR/Q5, 
        O2b => /MAR/Q6, 
        O3b => /MAR/Q7, 
        OEa => GND, 
        GND => GND, 
        OEb => GND, 
        I2a => Net-(U7-Q2), 
        I3a => Net-(U7-Q3), 
        I0b => Net-(U7-Q4), 
        I1b => Net-(U7-Q5), 
        I2b => Net-(U7-Q6), 
        I3b => Net-(U7-Q7), 
        VCC => VCC, 
        I0a => unconnected-(U9-I0a-Pad2), 
        I1a => unconnected-(U9-I1a-Pad4), 
        );


    U10 : component 74LS244
    port map(
        O0a => /MAR/Q8, 
        O1a => /MAR/Q9, 
        O2a => /MAR/Q10, 
        O3a => /MAR/Q11, 
        O0b => /MAR/Q12, 
        O1b => /MAR/Q13, 
        O2b => /MAR/Q14, 
        O3b => /MAR/Q15, 
        OEa => GND, 
        GND => GND, 
        OEb => GND, 
        I0a => Net-(U10-I0a), 
        I0b => Net-(U10-I0b), 
        I1a => Net-(U10-I1a), 
        I1b => Net-(U10-I1b), 
        I2a => Net-(U10-I2a), 
        I2b => Net-(U10-I2b), 
        I3a => Net-(U10-I3a), 
        I3b => Net-(U10-I3b), 
        VCC => VCC, 
        );


    U11 : component 74LS377
    port map(
        D0 => /A/D0, 
        D1 => /A/D1, 
        D2 => /A/D2, 
        D3 => /A/D3, 
        D4 => /A/D4, 
        D5 => /A/D5, 
        D6 => /A/D6, 
        D7 => /A/D7, 
        ~{E} => /~{A_EN}, 
        CP => CLK, 
        GND => GND, 
        Q2 => Net-(U11-Q2), 
        Q3 => Net-(U11-Q3), 
        Q4 => Net-(U11-Q4), 
        Q5 => Net-(U11-Q5), 
        Q6 => Net-(U11-Q6), 
        Q7 => Net-(U11-Q7), 
        VCC => VCC, 
        Q0 => unconnected-(U11-Q0-Pad2), 
        Q1 => unconnected-(U11-Q1-Pad5), 
        );


    U12 : component 74LS377
    port map(
        D0 => /A/D8, 
        D1 => /A/D9, 
        D2 => /A/D10, 
        D3 => /A/D11, 
        D4 => /A/D12, 
        D5 => /A/D13, 
        D6 => /A/D14, 
        D7 => /A/D15, 
        ~{E} => /~{A_EN}, 
        CP => CLK, 
        GND => GND, 
        Q0 => Net-(U12-Q0), 
        Q1 => Net-(U12-Q1), 
        Q2 => Net-(U12-Q2), 
        Q3 => Net-(U12-Q3), 
        Q4 => Net-(U12-Q4), 
        Q5 => Net-(U12-Q5), 
        Q6 => Net-(U12-Q6), 
        Q7 => Net-(U12-Q7), 
        VCC => VCC, 
        );


    U13 : component 74LS244
    port map(
        O0a => /A/Q0, 
        O1a => /A/Q1, 
        O2a => /A/Q2, 
        O3a => /A/Q3, 
        O0b => /A/Q4, 
        O1b => /A/Q5, 
        O2b => /A/Q6, 
        O3b => /A/Q7, 
        OEa => GND, 
        GND => GND, 
        OEb => GND, 
        I2a => Net-(U11-Q2), 
        I3a => Net-(U11-Q3), 
        I0b => Net-(U11-Q4), 
        I1b => Net-(U11-Q5), 
        I2b => Net-(U11-Q6), 
        I3b => Net-(U11-Q7), 
        VCC => VCC, 
        I0a => unconnected-(U13-I0a-Pad2), 
        I1a => unconnected-(U13-I1a-Pad4), 
        );


    U14 : component 74LS244
    port map(
        O0a => /A/Q8, 
        O1a => /A/Q9, 
        O2a => /A/Q10, 
        O3a => /A/Q11, 
        O0b => /A/Q12, 
        O1b => /A/Q13, 
        O2b => /A/Q14, 
        O3b => /A/Q15, 
        OEa => GND, 
        GND => GND, 
        OEb => GND, 
        I0a => Net-(U12-Q0), 
        I1a => Net-(U12-Q1), 
        I2a => Net-(U12-Q2), 
        I3a => Net-(U12-Q3), 
        I0b => Net-(U12-Q4), 
        I1b => Net-(U12-Q5), 
        I2b => Net-(U12-Q6), 
        I3b => Net-(U12-Q7), 
        VCC => VCC, 
        );


    U15 : component 74LS377
    port map(
        D0 => /A/D0, 
        D1 => /A/D1, 
        D2 => /A/D2, 
        D3 => /A/D3, 
        D4 => /A/D4, 
        D5 => /A/D5, 
        D6 => /A/D6, 
        D7 => /A/D7, 
        ~{E} => /~{B_EN}, 
        CP => CLK, 
        GND => GND, 
        Q2 => Net-(U15-Q2), 
        Q3 => Net-(U15-Q3), 
        Q4 => Net-(U15-Q4), 
        Q5 => Net-(U15-Q5), 
        Q6 => Net-(U15-Q6), 
        Q7 => Net-(U15-Q7), 
        VCC => VCC, 
        Q0 => unconnected-(U15-Q0-Pad2), 
        Q1 => unconnected-(U15-Q1-Pad5), 
        );


    U16 : component 74LS377
    port map(
        D0 => /A/D8, 
        D1 => /A/D9, 
        D2 => /A/D10, 
        D3 => /A/D11, 
        D4 => /A/D12, 
        D5 => /A/D13, 
        D6 => /A/D14, 
        D7 => /A/D15, 
        ~{E} => /~{B_EN}, 
        CP => CLK, 
        GND => GND, 
        Q0 => Net-(U16-Q0), 
        Q1 => Net-(U16-Q1), 
        Q2 => Net-(U16-Q2), 
        Q3 => Net-(U16-Q3), 
        Q4 => Net-(U16-Q4), 
        Q5 => Net-(U16-Q5), 
        Q6 => Net-(U16-Q6), 
        Q7 => Net-(U16-Q7), 
        VCC => VCC, 
        );


    U17 : component 74LS244
    port map(
        O0a => /ALU/A0, 
        O1a => /ALU/A1, 
        O2a => /ALU/A2, 
        O3a => /ALU/A3, 
        O0b => /ALU/A4, 
        O1b => /ALU/A5, 
        O2b => /ALU/A6, 
        O3b => /ALU/A7, 
        OEa => /~{B_OE}, 
        OEb => /~{B_OE}, 
        GND => GND, 
        I2a => Net-(U15-Q2), 
        I3a => Net-(U15-Q3), 
        I0b => Net-(U15-Q4), 
        I1b => Net-(U15-Q5), 
        I2b => Net-(U15-Q6), 
        I3b => Net-(U15-Q7), 
        VCC => VCC, 
        I0a => unconnected-(U17-I0a-Pad2), 
        I1a => unconnected-(U17-I1a-Pad4), 
        );


    U18 : component 74LS244
    port map(
        O0a => /ALU/A8, 
        O1a => /ALU/A9, 
        O2a => /ALU/A10, 
        O3a => /ALU/A11, 
        O0b => /ALU/A12, 
        O1b => /ALU/A13, 
        O2b => /ALU/A14, 
        O3b => /ALU/A15, 
        OEa => /~{B_OE}, 
        OEb => /~{B_OE}, 
        GND => GND, 
        I0a => Net-(U16-Q0), 
        I1a => Net-(U16-Q1), 
        I2a => Net-(U16-Q2), 
        I3a => Net-(U16-Q3), 
        I0b => Net-(U16-Q4), 
        I1b => Net-(U16-Q5), 
        I2b => Net-(U16-Q6), 
        I3b => Net-(U16-Q7), 
        VCC => VCC, 
        );


    U19 : component 74LS181
    port map(
        B0 => /A/Q0, 
        B1 => /A/Q1, 
        B2 => /A/Q2, 
        B3 => /A/Q3, 
        A0 => /ALU/A0, 
        A1 => /ALU/A1, 
        A2 => /ALU/A2, 
        A3 => /ALU/A3, 
        A=B => /ALU/EQ0, 
        F0 => /ALU/F0, 
        F1 => /ALU/F1, 
        F2 => /ALU/F2, 
        F3 => /ALU/F3, 
        S0 => /ALU_S0, 
        S1 => /ALU_S1, 
        S2 => /ALU_S2, 
        S3 => /ALU_S3, 
        M => /MODE, 
        Cn => /~{ALU_CIN}, 
        GND => GND, 
        X => Net-(U19-X), 
        Y => Net-(U19-Y), 
        VCC => VCC, 
        Cn+4 => unconnected-(U19-Cn+4-Pad16), 
        );


    U20 : component 74LS181
    port map(
        B0 => /A/Q4, 
        B1 => /A/Q5, 
        B2 => /A/Q6, 
        B3 => /A/Q7, 
        A0 => /ALU/A4, 
        A1 => /ALU/A5, 
        A2 => /ALU/A6, 
        A3 => /ALU/A7, 
        Cn => /ALU/CN+X, 
        A=B => /ALU/EQ1, 
        F0 => /ALU/F4, 
        F1 => /ALU/F5, 
        F2 => /ALU/F6, 
        F3 => /ALU/F7, 
        S0 => /ALU_S0, 
        S1 => /ALU_S1, 
        S2 => /ALU_S2, 
        S3 => /ALU_S3, 
        M => /MODE, 
        GND => GND, 
        X => Net-(U20-X), 
        Y => Net-(U20-Y), 
        VCC => VCC, 
        Cn+4 => unconnected-(U20-Cn+4-Pad16), 
        );


    U21 : component 74LS181
    port map(
        B0 => /A/Q8, 
        B1 => /A/Q9, 
        B2 => /A/Q10, 
        B3 => /A/Q11, 
        A0 => /ALU/A8, 
        A1 => /ALU/A9, 
        A2 => /ALU/A10, 
        A3 => /ALU/A11, 
        Cn => /ALU/CN+Y, 
        A=B => /ALU/EQ2, 
        F0 => /ALU/F8, 
        F1 => /ALU/F9, 
        F2 => /ALU/F10, 
        F3 => /ALU/F11, 
        S0 => /ALU_S0, 
        S1 => /ALU_S1, 
        S2 => /ALU_S2, 
        S3 => /ALU_S3, 
        M => /MODE, 
        GND => GND, 
        X => Net-(U21-X), 
        Y => Net-(U21-Y), 
        VCC => VCC, 
        Cn+4 => unconnected-(U21-Cn+4-Pad16), 
        );


    U22 : component 74LS181
    port map(
        B0 => /A/Q12, 
        B1 => /A/Q13, 
        B2 => /A/Q14, 
        B3 => /A/Q15, 
        A0 => /ALU/A12, 
        A1 => /ALU/A13, 
        A2 => /ALU/A14, 
        A3 => /ALU/A15, 
        Cn => /ALU/CN+Z, 
        A=B => /ALU/EQ3, 
        F0 => /ALU/F12, 
        F1 => /ALU/F13, 
        F2 => /ALU/F14, 
        F3 => /ALU/F15, 
        S0 => /ALU_S0, 
        S1 => /ALU_S1, 
        S2 => /ALU_S2, 
        S3 => /ALU_S3, 
        M => /MODE, 
        GND => GND, 
        X => Net-(U22-X), 
        Y => Net-(U22-Y), 
        VCC => VCC, 
        Cn+4 => unconnected-(U22-Cn+4-Pad16), 
        );


    U23 : component 74LS182
    port map(
        Cn+x => /ALU/CN+X, 
        Cn+y => /ALU/CN+Y, 
        Cn+z => /ALU/CN+Z, 
        G => /ALU/G, 
        P => /ALU/P, 
        Cn => /~{ALU_CIN}, 
        GND => GND, 
        P0 => Net-(U19-X), 
        G0 => Net-(U19-Y), 
        P1 => Net-(U20-X), 
        G1 => Net-(U20-Y), 
        P2 => Net-(U21-X), 
        G2 => Net-(U21-Y), 
        P3 => Net-(U22-X), 
        G3 => Net-(U22-Y), 
        VCC => VCC, 
        );


    U24 : component 74LS00
    port map(
         => /A/D15, 
         => /ALU_OF, 
         => Net-(U24-Pad3), 
         => Net-(U24-Pad4), 
         => Net-(U24-Pad5), 
         => VCC, 
        );


    U25 : component 74LS244
    port map(
        O0a => /A/D0, 
        O1a => /A/D1, 
        O2a => /A/D2, 
        O3a => /A/D3, 
        O0b => /A/D4, 
        O1b => /A/D5, 
        O2b => /A/D6, 
        O3b => /A/D7, 
        I0a => /ALU/F0, 
        I1a => /ALU/F1, 
        I2a => /ALU/F2, 
        I3a => /ALU/F3, 
        I0b => /ALU/F4, 
        I1b => /ALU/F5, 
        I2b => /ALU/F6, 
        I3b => /ALU/F7, 
        OEa => /~{ALU_OE}, 
        OEb => /~{ALU_OE}, 
        GND => GND, 
        VCC => VCC, 
        );


    U26 : component 74LS244
    port map(
        O0a => /A/D8, 
        O1a => /A/D9, 
        O2a => /A/D10, 
        O3a => /A/D11, 
        O0b => /A/D12, 
        O1b => /A/D13, 
        O2b => /A/D14, 
        O3b => /A/D15, 
        I0a => /ALU/F8, 
        I1a => /ALU/F9, 
        I2a => /ALU/F10, 
        I3a => /ALU/F11, 
        I0b => /ALU/F12, 
        I1b => /ALU/F13, 
        I2b => /ALU/F14, 
        I3b => /ALU/F15, 
        OEa => /~{ALU_OE}, 
        OEb => /~{ALU_OE}, 
        GND => GND, 
        VCC => VCC, 
        );


    U27 : component 74LS86
    port map(
         => /A/D15, 
         => /ALU/A15, 
         => Net-(U24-Pad4), 
        );


    U28 : component 74LS86
    port map(
         => /A/Q15, 
         => Net-(U24-Pad3), 
         => Net-(U24-Pad5), 
        );


    U29 : component 74LS20
    port map(
         => /ALU/EQ0, 
         => /ALU/EQ1, 
         => /ALU/EQ2, 
         => /ALU_EQ, 
         => unconnected-(U29-Pad5), 
        );


    U30 : component 74LS02
    port map(
         => /ALU/EQH, 
         => /ALU/EQL, 
         => /ALU_Z, 
        );


    U31 : component SN74LS682
    port map(
        Q7 => /ALU/EQL, 
        P0 => /ALU/F0, 
        P1 => /ALU/F1, 
        P2 => /ALU/F2, 
        P3 => /ALU/F3, 
        P4 => /ALU/F4, 
        P5 => /ALU/F5, 
        P6 => /ALU/F6, 
        P7 => /ALU/F7, 
        GND => GND, 
        Q4 => GND, 
        Q5 => GND, 
        Q6 => GND, 
        Q7 => GND, 
        Q0 => GND, 
        Q1 => GND, 
        Q2 => GND, 
        Q3 => GND, 
        VCC => VCC, 
        ~{P>Q} => unconnected-(U31-~{P>Q}-Pad1), 
        );


    U32 : component SN74LS682
    port map(
        Q7 => /ALU/EQH, 
        P0 => /ALU/F8, 
        P1 => /ALU/F9, 
        P2 => /ALU/F10, 
        P3 => /ALU/F11, 
        P4 => /ALU/F12, 
        P5 => /ALU/F13, 
        P6 => /ALU/F14, 
        P7 => /ALU/F15, 
        GND => GND, 
        Q4 => GND, 
        Q5 => GND, 
        Q6 => GND, 
        Q7 => GND, 
        Q0 => GND, 
        Q1 => GND, 
        Q2 => GND, 
        Q3 => GND, 
        VCC => VCC, 
        ~{P>Q} => unconnected-(U32-~{P>Q}-Pad1), 
        );


    U33 : component KM62256CLP
    port map(
        Q0 => /ALU/A0, 
        Q1 => /ALU/A1, 
        Q2 => /ALU/A2, 
        Q3 => /ALU/A3, 
        Q4 => /ALU/A4, 
        Q5 => /ALU/A5, 
        Q6 => /ALU/A6, 
        Q7 => /ALU/A7, 
        A0 => /MAR/Q0, 
        A1 => /MAR/Q1, 
        A2 => /MAR/Q2, 
        A3 => /MAR/Q3, 
        A4 => /MAR/Q4, 
        A5 => /MAR/Q5, 
        A6 => /MAR/Q6, 
        A7 => /MAR/Q7, 
        A8 => /MAR/Q8, 
        A9 => /MAR/Q9, 
        A10 => /MAR/Q10, 
        A11 => /MAR/Q11, 
        A12 => /MAR/Q12, 
        A13 => /MAR/Q13, 
        A14 => /MAR/Q14, 
        ~{OE} => /~{RAM_OE}, 
        ~{WE} => /~{RAM_WE}, 
        GND => GND, 
        ~{CS} => GND, 
        VCC => VCC, 
        );


    U34 : component KM62256CLP
    port map(
        Q0 => /ALU/A8, 
        Q1 => /ALU/A9, 
        Q2 => /ALU/A10, 
        Q3 => /ALU/A11, 
        Q4 => /ALU/A12, 
        Q5 => /ALU/A13, 
        Q6 => /ALU/A14, 
        Q7 => /ALU/A15, 
        A0 => /MAR/Q0, 
        A1 => /MAR/Q1, 
        A2 => /MAR/Q2, 
        A3 => /MAR/Q3, 
        A4 => /MAR/Q4, 
        A5 => /MAR/Q5, 
        A6 => /MAR/Q6, 
        A7 => /MAR/Q7, 
        A8 => /MAR/Q8, 
        A9 => /MAR/Q9, 
        A10 => /MAR/Q10, 
        A11 => /MAR/Q11, 
        A12 => /MAR/Q12, 
        A13 => /MAR/Q13, 
        A14 => /MAR/Q14, 
        ~{OE} => /~{RAM_OE}, 
        ~{WE} => /~{RAM_WE}, 
        GND => GND, 
        ~{CS} => GND, 
        VCC => VCC, 
        );


    U35 : component 74LS377
    port map(
        D0 => /ALU/A0, 
        D1 => /ALU/A1, 
        D2 => /ALU/A2, 
        D3 => /ALU/A3, 
        D4 => /ALU/A4, 
        D5 => /ALU/A5, 
        D6 => /ALU/A6, 
        D7 => /ALU/A7, 
        ~{E} => /~{IR_EN}, 
        CP => CLK, 
        GND => GND, 
        Q2 => Net-(U35-Q2), 
        Q3 => Net-(U35-Q3), 
        Q4 => Net-(U35-Q4), 
        Q5 => Net-(U35-Q5), 
        Q6 => Net-(U35-Q6), 
        Q7 => Net-(U35-Q7), 
        VCC => VCC, 
        Q0 => unconnected-(U35-Q0-Pad2), 
        Q1 => unconnected-(U35-Q1-Pad5), 
        );


    U36 : component 74LS377
    port map(
        D0 => /ALU/A8, 
        D1 => /ALU/A9, 
        D2 => /ALU/A10, 
        D3 => /ALU/A11, 
        D4 => /ALU/A12, 
        D5 => /ALU/A13, 
        D6 => /ALU/A14, 
        D7 => /ALU/A15, 
        ~{E} => /~{IR_EN}, 
        CP => CLK, 
        GND => GND, 
        Q0 => Net-(U36-Q0), 
        Q1 => Net-(U36-Q1), 
        Q2 => Net-(U36-Q2), 
        Q3 => Net-(U36-Q3), 
        Q4 => Net-(U36-Q4), 
        Q5 => Net-(U36-Q5), 
        Q6 => Net-(U36-Q6), 
        Q7 => Net-(U36-Q7), 
        VCC => VCC, 
        );


    U37 : component 74LS244
    port map(
        O0a => /IR/Q0, 
        O1a => /IR/Q1, 
        O2a => /IR/Q2, 
        O3a => /IR/Q3, 
        O0b => /IR/Q4, 
        O1b => /IR/Q5, 
        O2b => /IR/Q6, 
        O3b => /IR/Q7, 
        OEa => /~{IR_OE}, 
        OEb => /~{IR_OE}, 
        GND => GND, 
        I2a => Net-(U35-Q2), 
        I3a => Net-(U35-Q3), 
        I0b => Net-(U35-Q4), 
        I1b => Net-(U35-Q5), 
        I2b => Net-(U35-Q6), 
        I3b => Net-(U35-Q7), 
        VCC => VCC, 
        I0a => unconnected-(U37-I0a-Pad2), 
        I1a => unconnected-(U37-I1a-Pad4), 
        );


    U38 : component 74LS244
    port map(
        O0a => /IR/Q8, 
        O1a => /IR/Q9, 
        O2a => /IR/Q10, 
        O3a => /IR/Q11, 
        O0b => /IR/Q12, 
        O1b => /IR/Q13, 
        O2b => /IR/Q14, 
        O3b => /IR/Q15, 
        OEa => /~{IR_OE}, 
        OEb => /~{IR_OE}, 
        GND => GND, 
        I0a => Net-(U36-Q0), 
        I1a => Net-(U36-Q1), 
        I2a => Net-(U36-Q2), 
        I3a => Net-(U36-Q3), 
        I0b => Net-(U36-Q4), 
        I1b => Net-(U36-Q5), 
        I2b => Net-(U36-Q6), 
        I3b => Net-(U36-Q7), 
        VCC => VCC, 
        );


    U39 : component 74LS377
    port map(
        D0 => /A/D0, 
        D1 => /A/D1, 
        D2 => /A/D2, 
        D3 => /A/D3, 
        D4 => /A/D4, 
        D5 => /A/D5, 
        D6 => /A/D6, 
        D7 => /A/D7, 
        ~{E} => /~{C_EN}, 
        CP => CLK, 
        GND => GND, 
        Q2 => Net-(U39-Q2), 
        Q3 => Net-(U39-Q3), 
        Q4 => Net-(U39-Q4), 
        Q5 => Net-(U39-Q5), 
        Q6 => Net-(U39-Q6), 
        Q7 => Net-(U39-Q7), 
        VCC => VCC, 
        Q0 => unconnected-(U39-Q0-Pad2), 
        Q1 => unconnected-(U39-Q1-Pad5), 
        );


    U40 : component 74LS377
    port map(
        D0 => /A/D8, 
        D1 => /A/D9, 
        D2 => /A/D10, 
        D3 => /A/D11, 
        D4 => /A/D12, 
        D5 => /A/D13, 
        D6 => /A/D14, 
        D7 => /A/D15, 
        ~{E} => /~{C_EN}, 
        CP => CLK, 
        GND => GND, 
        Q0 => Net-(U40-Q0), 
        Q1 => Net-(U40-Q1), 
        Q2 => Net-(U40-Q2), 
        Q3 => Net-(U40-Q3), 
        Q4 => Net-(U40-Q4), 
        Q5 => Net-(U40-Q5), 
        Q6 => Net-(U40-Q6), 
        Q7 => Net-(U40-Q7), 
        VCC => VCC, 
        );


    U41 : component 74LS244
    port map(
        O0a => /ALU/A0, 
        O1a => /ALU/A1, 
        O2a => /ALU/A2, 
        O3a => /ALU/A3, 
        O0b => /ALU/A4, 
        O1b => /ALU/A5, 
        O2b => /ALU/A6, 
        O3b => /ALU/A7, 
        OEa => /~{C_OE}, 
        OEb => /~{C_OE}, 
        GND => GND, 
        I2a => Net-(U39-Q2), 
        I3a => Net-(U39-Q3), 
        I0b => Net-(U39-Q4), 
        I1b => Net-(U39-Q5), 
        I2b => Net-(U39-Q6), 
        I3b => Net-(U39-Q7), 
        VCC => VCC, 
        I0a => unconnected-(U41-I0a-Pad2), 
        I1a => unconnected-(U41-I1a-Pad4), 
        );


    U42 : component 74LS244
    port map(
        O0a => /ALU/A8, 
        O1a => /ALU/A9, 
        O2a => /ALU/A10, 
        O3a => /ALU/A11, 
        O0b => /ALU/A12, 
        O1b => /ALU/A13, 
        O2b => /ALU/A14, 
        O3b => /ALU/A15, 
        OEa => /~{C_OE}, 
        OEb => /~{C_OE}, 
        GND => GND, 
        I0a => Net-(U40-Q0), 
        I1a => Net-(U40-Q1), 
        I2a => Net-(U40-Q2), 
        I3a => Net-(U40-Q3), 
        I0b => Net-(U40-Q4), 
        I1b => Net-(U40-Q5), 
        I2b => Net-(U40-Q6), 
        I3b => Net-(U40-Q7), 
        VCC => VCC, 
        );


    U45 : component 74LS377
    port map(
        CP => /ALU_EQ, 
        ~{E} => /ALU_OF, 
        D0 => /IR/Q0, 
        D1 => /IR/Q1, 
        D2 => /IR/Q2, 
        D3 => /IR/Q3, 
        D4 => /IR/Q4, 
        D5 => /IR/Q5, 
        D6 => /IR/Q6, 
        D7 => /IR/Q7, 
        Q3 => /~{IR_EN}, 
        Q4 => /~{IR_OE}, 
        Q5 => /~{MAR_EN}, 
        Q1 => /~{PC_INC}, 
        Q0 => /~{PC_LD}, 
        Q2 => /~{PC_OE}, 
        Q7 => /~{RAM_OE}, 
        Q6 => /~{RAM_WE}, 
        GND => unconnected-(U45-GND-Pad10), 
        VCC => unconnected-(U45-VCC-Pad20), 
        );


    U46 : component 74LS377
    port map(
        CP => /ALU_EQ, 
        ~{E} => /ALU_OF, 
        D0 => /IR/Q8, 
        D1 => /IR/Q9, 
        D2 => /IR/Q10, 
        D3 => /IR/Q11, 
        D4 => /IR/Q12, 
        D5 => /IR/Q13, 
        D6 => /IR/Q14, 
        D7 => /IR/Q15, 
        Q5 => /~{ALU2B}, 
        Q4 => /~{ALU_EN}, 
        Q6 => /~{ALU_OE}, 
        Q0 => /~{B_EN}, 
        Q1 => /~{B_OE}, 
        Q2 => /~{C_EN}, 
        Q3 => /~{C_OE}, 
        GND => unconnected-(U46-GND-Pad10), 
        Q7 => unconnected-(U46-Q7-Pad19), 
        VCC => unconnected-(U46-VCC-Pad20), 
        );


    U43 : component 74LS244
    port map(
        I0a => /A/D0, 
        I1a => /A/D1, 
        I2a => /A/D2, 
        I3a => /A/D3, 
        I0b => /A/D4, 
        I1b => /A/D5, 
        I2b => /A/D6, 
        I3b => /A/D7, 
        O0a => /ALU/A0, 
        O1a => /ALU/A1, 
        O2a => /ALU/A2, 
        O3a => /ALU/A3, 
        O0b => /ALU/A4, 
        O1b => /ALU/A5, 
        O2b => /ALU/A6, 
        O3b => /ALU/A7, 
        OEa => /~{ALU2B}, 
        OEb => /~{ALU2B}, 
        GND => GND, 
        VCC => VCC, 
        );


    U44 : component 74LS244
    port map(
        I0a => /A/D8, 
        I1a => /A/D9, 
        I2a => /A/D10, 
        I3a => /A/D11, 
        I0b => /A/D12, 
        I1b => /A/D13, 
        I2b => /A/D14, 
        I3b => /A/D15, 
        O0a => /ALU/A8, 
        O1a => /ALU/A9, 
        O2a => /ALU/A10, 
        O3a => /ALU/A11, 
        O0b => /ALU/A12, 
        O1b => /ALU/A13, 
        O2b => /ALU/A14, 
        O3b => /ALU/A15, 
        OEa => /~{ALU2B}, 
        OEb => /~{ALU2B}, 
        GND => GND, 
        VCC => VCC, 
        );




end architecture rtl;
