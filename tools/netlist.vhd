-- Generated from KiCad XML using OpenCores TTLParts.vhd
-- Named KiCad nets are exposed as top-level ports.
-- Unconnected TTL inputs are represented by 'U' and reported.

library ieee;
use ieee.std_logic_1164.all;

entity schematic is
    port (
        a_d0 : out std_logic;
        a_d1 : out std_logic;
        a_d2 : out std_logic;
        a_d3 : out std_logic;
        a_d4 : out std_logic;
        a_d5 : out std_logic;
        a_d6 : out std_logic;
        a_d7 : out std_logic;
        a_d8 : out std_logic;
        a_d9 : out std_logic;
        a_d10 : out std_logic;
        a_d11 : out std_logic;
        a_d12 : out std_logic;
        a_d13 : out std_logic;
        a_d14 : out std_logic;
        a_d15 : out std_logic;
        a_q0 : out std_logic;
        a_q1 : out std_logic;
        a_q2 : out std_logic;
        a_q3 : out std_logic;
        a_q4 : out std_logic;
        a_q5 : out std_logic;
        a_q6 : out std_logic;
        a_q7 : out std_logic;
        a_q8 : out std_logic;
        a_q9 : out std_logic;
        a_q10 : out std_logic;
        a_q11 : out std_logic;
        a_q12 : out std_logic;
        a_q13 : out std_logic;
        a_q14 : out std_logic;
        a_q15 : out std_logic;
        alu_a0 : out std_logic;
        alu_a1 : out std_logic;
        alu_a2 : out std_logic;
        alu_a3 : out std_logic;
        alu_a4 : out std_logic;
        alu_a5 : out std_logic;
        alu_a6 : out std_logic;
        alu_a7 : out std_logic;
        alu_a8 : out std_logic;
        alu_a9 : out std_logic;
        alu_a10 : out std_logic;
        alu_a11 : out std_logic;
        alu_a12 : out std_logic;
        alu_a13 : out std_logic;
        alu_a14 : out std_logic;
        alu_a15 : out std_logic;
        alu_cn_x : out std_logic;
        alu_cn_y : out std_logic;
        alu_cn_z : out std_logic;
        alu_eq0 : out std_logic;
        alu_eq1 : out std_logic;
        alu_eq2 : out std_logic;
        alu_eq3 : out std_logic;
        alu_eqh : in std_logic;
        alu_eql : in std_logic;
        alu_f0 : out std_logic;
        alu_f1 : out std_logic;
        alu_f2 : out std_logic;
        alu_f3 : out std_logic;
        alu_f4 : out std_logic;
        alu_f5 : out std_logic;
        alu_f6 : out std_logic;
        alu_f7 : out std_logic;
        alu_f8 : out std_logic;
        alu_f9 : out std_logic;
        alu_f10 : out std_logic;
        alu_f11 : out std_logic;
        alu_f12 : out std_logic;
        alu_f13 : out std_logic;
        alu_f14 : out std_logic;
        alu_f15 : out std_logic;
        alu_g : out std_logic;
        alu_p : out std_logic;
        alu_eq : out std_logic;
        alu_of : out std_logic;
        alu_s0 : in std_logic;
        alu_s1 : in std_logic;
        alu_s2 : in std_logic;
        alu_s3 : in std_logic;
        alu_z : out std_logic;
        ir_q0 : out std_logic;
        ir_q1 : out std_logic;
        ir_q2 : out std_logic;
        ir_q3 : out std_logic;
        ir_q4 : out std_logic;
        ir_q5 : out std_logic;
        ir_q6 : out std_logic;
        ir_q7 : out std_logic;
        ir_q8 : out std_logic;
        ir_q9 : out std_logic;
        ir_q10 : out std_logic;
        ir_q11 : out std_logic;
        ir_q12 : out std_logic;
        ir_q13 : out std_logic;
        ir_q14 : out std_logic;
        ir_q15 : out std_logic;
        mar_q0 : out std_logic;
        mar_q1 : out std_logic;
        mar_q2 : out std_logic;
        mar_q3 : out std_logic;
        mar_q4 : out std_logic;
        mar_q5 : out std_logic;
        mar_q6 : out std_logic;
        mar_q7 : out std_logic;
        mar_q8 : out std_logic;
        mar_q9 : out std_logic;
        mar_q10 : out std_logic;
        mar_q11 : out std_logic;
        mar_q12 : out std_logic;
        mar_q13 : out std_logic;
        mar_q14 : out std_logic;
        mar_q15 : out std_logic;
        mode : in std_logic;
        alu2b : out std_logic;
        alu_cin : in std_logic;
        alu_en : out std_logic;
        alu_oe : out std_logic;
        a_en : in std_logic;
        b_en : out std_logic;
        b_oe : out std_logic;
        c_en : out std_logic;
        c_oe : out std_logic;
        ir_en : out std_logic;
        ir_oe : out std_logic;
        mar_en : out std_logic;
        pc_inc : out std_logic;
        pc_ld : out std_logic;
        pc_oe : out std_logic;
        ram_oe : out std_logic;
        ram_we : out std_logic;
        clk : in std_logic;
        unconnected_u1_tc_pad15 : out std_logic;
        unconnected_u7_q0_pad2 : out std_logic;
        unconnected_u7_q1_pad5 : out std_logic;
        unconnected_u9_i0a_pad2 : in std_logic;
        unconnected_u9_i1a_pad4 : in std_logic;
        unconnected_u11_q0_pad2 : out std_logic;
        unconnected_u11_q1_pad5 : out std_logic;
        unconnected_u13_i0a_pad2 : in std_logic;
        unconnected_u13_i1a_pad4 : in std_logic;
        unconnected_u15_q0_pad2 : out std_logic;
        unconnected_u15_q1_pad5 : out std_logic;
        unconnected_u17_i0a_pad2 : in std_logic;
        unconnected_u17_i1a_pad4 : in std_logic;
        unconnected_u19_cn_4_pad16 : out std_logic;
        unconnected_u20_cn_4_pad16 : out std_logic;
        unconnected_u21_cn_4_pad16 : out std_logic;
        unconnected_u22_cn_4_pad16 : out std_logic;
        unconnected_u29_pad5 : in std_logic;
        unconnected_u31_p_q_pad1 : out std_logic;
        unconnected_u32_p_q_pad1 : out std_logic;
        unconnected_u35_q0_pad2 : out std_logic;
        unconnected_u35_q1_pad5 : out std_logic;
        unconnected_u37_i0a_pad2 : in std_logic;
        unconnected_u37_i1a_pad4 : in std_logic;
        unconnected_u39_q0_pad2 : out std_logic;
        unconnected_u39_q1_pad5 : out std_logic;
        unconnected_u41_i0a_pad2 : in std_logic;
        unconnected_u41_i1a_pad4 : in std_logic;
        unconnected_u45_gnd_pad10 : in std_logic;
        unconnected_u45_vcc_pad20 : in std_logic;
        unconnected_u46_gnd_pad10 : in std_logic;
        unconnected_u46_q7_pad19 : out std_logic;
        unconnected_u46_vcc_pad20 : in std_logic
    );
end entity;

architecture structural of schematic is

    signal gnd : std_logic; -- KiCad net: GND
    signal net_n_145 : std_logic; -- KiCad net: Net-(U1-CET)
    signal net_n_146 : std_logic; -- KiCad net: Net-(U1-Q0)
    signal net_n_147 : std_logic; -- KiCad net: Net-(U1-Q1)
    signal net_n_148 : std_logic; -- KiCad net: Net-(U1-Q2)
    signal net_n_149 : std_logic; -- KiCad net: Net-(U1-Q3)
    signal net_n_150 : std_logic; -- KiCad net: Net-(U2-I0a)
    signal net_n_151 : std_logic; -- KiCad net: Net-(U2-I1a)
    signal net_n_152 : std_logic; -- KiCad net: Net-(U2-I2a)
    signal net_n_153 : std_logic; -- KiCad net: Net-(U2-I3a)
    signal net_n_154 : std_logic; -- KiCad net: Net-(U3-CET)
    signal net_n_155 : std_logic; -- KiCad net: Net-(U4-CET)
    signal net_n_156 : std_logic; -- KiCad net: Net-(U4-Q0)
    signal net_n_157 : std_logic; -- KiCad net: Net-(U4-Q1)
    signal net_n_158 : std_logic; -- KiCad net: Net-(U4-Q2)
    signal net_n_159 : std_logic; -- KiCad net: Net-(U4-Q3)
    signal net_n_160 : std_logic; -- KiCad net: Net-(U5-I0a)
    signal net_n_161 : std_logic; -- KiCad net: Net-(U5-I1a)
    signal net_n_162 : std_logic; -- KiCad net: Net-(U5-I2a)
    signal net_n_163 : std_logic; -- KiCad net: Net-(U5-I3a)
    signal net_n_164 : std_logic; -- KiCad net: Net-(U7-Q2)
    signal net_n_165 : std_logic; -- KiCad net: Net-(U7-Q3)
    signal net_n_166 : std_logic; -- KiCad net: Net-(U7-Q4)
    signal net_n_167 : std_logic; -- KiCad net: Net-(U7-Q5)
    signal net_n_168 : std_logic; -- KiCad net: Net-(U7-Q6)
    signal net_n_169 : std_logic; -- KiCad net: Net-(U7-Q7)
    signal net_n_170 : std_logic; -- KiCad net: Net-(U10-I0a)
    signal net_n_171 : std_logic; -- KiCad net: Net-(U10-I0b)
    signal net_n_172 : std_logic; -- KiCad net: Net-(U10-I1a)
    signal net_n_173 : std_logic; -- KiCad net: Net-(U10-I1b)
    signal net_n_174 : std_logic; -- KiCad net: Net-(U10-I2a)
    signal net_n_175 : std_logic; -- KiCad net: Net-(U10-I2b)
    signal net_n_176 : std_logic; -- KiCad net: Net-(U10-I3a)
    signal net_n_177 : std_logic; -- KiCad net: Net-(U10-I3b)
    signal net_n_178 : std_logic; -- KiCad net: Net-(U11-Q2)
    signal net_n_179 : std_logic; -- KiCad net: Net-(U11-Q3)
    signal net_n_180 : std_logic; -- KiCad net: Net-(U11-Q4)
    signal net_n_181 : std_logic; -- KiCad net: Net-(U11-Q5)
    signal net_n_182 : std_logic; -- KiCad net: Net-(U11-Q6)
    signal net_n_183 : std_logic; -- KiCad net: Net-(U11-Q7)
    signal net_n_184 : std_logic; -- KiCad net: Net-(U12-Q0)
    signal net_n_185 : std_logic; -- KiCad net: Net-(U12-Q1)
    signal net_n_186 : std_logic; -- KiCad net: Net-(U12-Q2)
    signal net_n_187 : std_logic; -- KiCad net: Net-(U12-Q3)
    signal net_n_188 : std_logic; -- KiCad net: Net-(U12-Q4)
    signal net_n_189 : std_logic; -- KiCad net: Net-(U12-Q5)
    signal net_n_190 : std_logic; -- KiCad net: Net-(U12-Q6)
    signal net_n_191 : std_logic; -- KiCad net: Net-(U12-Q7)
    signal net_n_192 : std_logic; -- KiCad net: Net-(U15-Q2)
    signal net_n_193 : std_logic; -- KiCad net: Net-(U15-Q3)
    signal net_n_194 : std_logic; -- KiCad net: Net-(U15-Q4)
    signal net_n_195 : std_logic; -- KiCad net: Net-(U15-Q5)
    signal net_n_196 : std_logic; -- KiCad net: Net-(U15-Q6)
    signal net_n_197 : std_logic; -- KiCad net: Net-(U15-Q7)
    signal net_n_198 : std_logic; -- KiCad net: Net-(U16-Q0)
    signal net_n_199 : std_logic; -- KiCad net: Net-(U16-Q1)
    signal net_n_200 : std_logic; -- KiCad net: Net-(U16-Q2)
    signal net_n_201 : std_logic; -- KiCad net: Net-(U16-Q3)
    signal net_n_202 : std_logic; -- KiCad net: Net-(U16-Q4)
    signal net_n_203 : std_logic; -- KiCad net: Net-(U16-Q5)
    signal net_n_204 : std_logic; -- KiCad net: Net-(U16-Q6)
    signal net_n_205 : std_logic; -- KiCad net: Net-(U16-Q7)
    signal net_n_206 : std_logic; -- KiCad net: Net-(U19-X)
    signal net_n_207 : std_logic; -- KiCad net: Net-(U19-Y)
    signal net_n_208 : std_logic; -- KiCad net: Net-(U20-X)
    signal net_n_209 : std_logic; -- KiCad net: Net-(U20-Y)
    signal net_n_210 : std_logic; -- KiCad net: Net-(U21-X)
    signal net_n_211 : std_logic; -- KiCad net: Net-(U21-Y)
    signal net_n_212 : std_logic; -- KiCad net: Net-(U22-X)
    signal net_n_213 : std_logic; -- KiCad net: Net-(U22-Y)
    signal net_n_214 : std_logic; -- KiCad net: Net-(U24-Pad3)
    signal net_n_215 : std_logic; -- KiCad net: Net-(U24-Pad4)
    signal net_n_216 : std_logic; -- KiCad net: Net-(U24-Pad5)
    signal net_n_217 : std_logic; -- KiCad net: Net-(U35-Q2)
    signal net_n_218 : std_logic; -- KiCad net: Net-(U35-Q3)
    signal net_n_219 : std_logic; -- KiCad net: Net-(U35-Q4)
    signal net_n_220 : std_logic; -- KiCad net: Net-(U35-Q5)
    signal net_n_221 : std_logic; -- KiCad net: Net-(U35-Q6)
    signal net_n_222 : std_logic; -- KiCad net: Net-(U35-Q7)
    signal net_n_223 : std_logic; -- KiCad net: Net-(U36-Q0)
    signal net_n_224 : std_logic; -- KiCad net: Net-(U36-Q1)
    signal net_n_225 : std_logic; -- KiCad net: Net-(U36-Q2)
    signal net_n_226 : std_logic; -- KiCad net: Net-(U36-Q3)
    signal net_n_227 : std_logic; -- KiCad net: Net-(U36-Q4)
    signal net_n_228 : std_logic; -- KiCad net: Net-(U36-Q5)
    signal net_n_229 : std_logic; -- KiCad net: Net-(U36-Q6)
    signal net_n_230 : std_logic; -- KiCad net: Net-(U36-Q7)
    signal net_n_231 : std_logic; -- KiCad net: Net-(U39-Q2)
    signal net_n_232 : std_logic; -- KiCad net: Net-(U39-Q3)
    signal net_n_233 : std_logic; -- KiCad net: Net-(U39-Q4)
    signal net_n_234 : std_logic; -- KiCad net: Net-(U39-Q5)
    signal net_n_235 : std_logic; -- KiCad net: Net-(U39-Q6)
    signal net_n_236 : std_logic; -- KiCad net: Net-(U39-Q7)
    signal net_n_237 : std_logic; -- KiCad net: Net-(U40-Q0)
    signal net_n_238 : std_logic; -- KiCad net: Net-(U40-Q1)
    signal net_n_239 : std_logic; -- KiCad net: Net-(U40-Q2)
    signal net_n_240 : std_logic; -- KiCad net: Net-(U40-Q3)
    signal net_n_241 : std_logic; -- KiCad net: Net-(U40-Q4)
    signal net_n_242 : std_logic; -- KiCad net: Net-(U40-Q5)
    signal net_n_243 : std_logic; -- KiCad net: Net-(U40-Q6)
    signal net_n_244 : std_logic; -- KiCad net: Net-(U40-Q7)
    signal vcc : std_logic; -- KiCad net: VCC
    signal gnd : std_logic;
    signal vcc : std_logic;

begin

    gnd <= '0';
    vcc <= '1';
    gnd <= '0';
    vcc <= '1';

    -- U1: 74LS163 -> SN74LS163N
    u1 : entity work.SN74LS163N
        port map (
            X_1 => vcc,
            X_2 => clk,
            X_3 => a_d12,
            X_4 => a_d13,
            X_5 => a_d14,
            X_6 => a_d15,
            X_7 => pc_inc,
            X_8 => gnd,
            X_9 => pc_ld,
            X_10 => net_n_145,
            X_11 => net_n_149,
            X_12 => net_n_148,
            X_13 => net_n_147,
            X_14 => net_n_146,
            X_15 => unconnected_u1_tc_pad15,
            X_16 => vcc
        );

    -- U2: 74LS244 -> SN74LS244N
    u2 : entity work.SN74LS244N
        port map (
            X_1 => pc_oe,
            X_2 => net_n_150,
            X_3 => alu_a15,
            X_4 => net_n_151,
            X_5 => alu_a14,
            X_6 => net_n_152,
            X_7 => alu_a13,
            X_8 => net_n_153,
            X_9 => alu_a12,
            X_10 => gnd,
            X_11 => net_n_146,
            X_12 => alu_a11,
            X_13 => net_n_147,
            X_14 => alu_a10,
            X_15 => net_n_148,
            X_16 => alu_a9,
            X_17 => net_n_149,
            X_18 => alu_a8,
            X_19 => pc_oe,
            X_20 => vcc
        );

    -- U3: 74LS163 -> SN74LS163N
    u3 : entity work.SN74LS163N
        port map (
            X_1 => vcc,
            X_2 => clk,
            X_3 => a_d8,
            X_4 => a_d9,
            X_5 => a_d10,
            X_6 => a_d11,
            X_7 => pc_inc,
            X_8 => gnd,
            X_9 => pc_ld,
            X_10 => net_n_154,
            X_11 => net_n_153,
            X_12 => net_n_152,
            X_13 => net_n_151,
            X_14 => net_n_150,
            X_15 => net_n_145,
            X_16 => vcc
        );

    -- U4: 74LS163 -> SN74LS163N
    u4 : entity work.SN74LS163N
        port map (
            X_1 => vcc,
            X_2 => clk,
            X_3 => a_d4,
            X_4 => a_d5,
            X_5 => a_d6,
            X_6 => a_d7,
            X_7 => pc_inc,
            X_8 => gnd,
            X_9 => pc_ld,
            X_10 => net_n_155,
            X_11 => net_n_159,
            X_12 => net_n_158,
            X_13 => net_n_157,
            X_14 => net_n_156,
            X_15 => net_n_154,
            X_16 => vcc
        );

    -- U5: 74LS244 -> SN74LS244N
    u5 : entity work.SN74LS244N
        port map (
            X_1 => pc_oe,
            X_2 => net_n_160,
            X_3 => alu_a7,
            X_4 => net_n_161,
            X_5 => alu_a6,
            X_6 => net_n_162,
            X_7 => alu_a5,
            X_8 => net_n_163,
            X_9 => alu_a4,
            X_10 => gnd,
            X_11 => net_n_156,
            X_12 => alu_a3,
            X_13 => net_n_157,
            X_14 => alu_a2,
            X_15 => net_n_158,
            X_16 => alu_a1,
            X_17 => net_n_159,
            X_18 => alu_a0,
            X_19 => pc_oe,
            X_20 => vcc
        );

    -- U6: 74LS163 -> SN74LS163N
    u6 : entity work.SN74LS163N
        port map (
            X_1 => vcc,
            X_2 => clk,
            X_3 => a_d0,
            X_4 => a_d1,
            X_5 => a_d2,
            X_6 => a_d3,
            X_7 => pc_inc,
            X_8 => gnd,
            X_9 => pc_ld,
            X_10 => pc_inc,
            X_11 => net_n_163,
            X_12 => net_n_162,
            X_13 => net_n_161,
            X_14 => net_n_160,
            X_15 => net_n_155,
            X_16 => vcc
        );

    -- U7: 74LS377 -> SN74LS377N
    u7 : entity work.SN74LS377N
        port map (
            X_1 => mar_en,
            X_2 => unconnected_u7_q0_pad2,
            X_3 => a_d0,
            X_4 => a_d1,
            X_5 => unconnected_u7_q1_pad5,
            X_6 => net_n_164,
            X_7 => a_d2,
            X_8 => a_d3,
            X_9 => net_n_165,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_166,
            X_13 => a_d4,
            X_14 => a_d5,
            X_15 => net_n_167,
            X_16 => net_n_168,
            X_17 => a_d6,
            X_18 => a_d7,
            X_19 => net_n_169,
            X_20 => vcc
        );

    -- U8: 74LS377 -> SN74LS377N
    u8 : entity work.SN74LS377N
        port map (
            X_1 => mar_en,
            X_2 => net_n_170,
            X_3 => a_d8,
            X_4 => a_d9,
            X_5 => net_n_172,
            X_6 => net_n_174,
            X_7 => a_d10,
            X_8 => a_d11,
            X_9 => net_n_176,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_171,
            X_13 => a_d12,
            X_14 => a_d13,
            X_15 => net_n_173,
            X_16 => net_n_175,
            X_17 => a_d14,
            X_18 => a_d15,
            X_19 => net_n_177,
            X_20 => vcc
        );

    -- U9: 74LS244 -> SN74LS244N
    u9 : entity work.SN74LS244N
        port map (
            X_1 => gnd,
            X_2 => unconnected_u9_i0a_pad2,
            X_3 => mar_q7,
            X_4 => unconnected_u9_i1a_pad4,
            X_5 => mar_q6,
            X_6 => net_n_164,
            X_7 => mar_q5,
            X_8 => net_n_165,
            X_9 => mar_q4,
            X_10 => gnd,
            X_11 => net_n_166,
            X_12 => mar_q3,
            X_13 => net_n_167,
            X_14 => mar_q2,
            X_15 => net_n_168,
            X_16 => mar_q1,
            X_17 => net_n_169,
            X_18 => mar_q0,
            X_19 => gnd,
            X_20 => vcc
        );

    -- U10: 74LS244 -> SN74LS244N
    u10 : entity work.SN74LS244N
        port map (
            X_1 => gnd,
            X_2 => net_n_170,
            X_3 => mar_q15,
            X_4 => net_n_172,
            X_5 => mar_q14,
            X_6 => net_n_174,
            X_7 => mar_q13,
            X_8 => net_n_176,
            X_9 => mar_q12,
            X_10 => gnd,
            X_11 => net_n_171,
            X_12 => mar_q11,
            X_13 => net_n_173,
            X_14 => mar_q10,
            X_15 => net_n_175,
            X_16 => mar_q9,
            X_17 => net_n_177,
            X_18 => mar_q8,
            X_19 => gnd,
            X_20 => vcc
        );

    -- U11: 74LS377 -> SN74LS377N
    u11 : entity work.SN74LS377N
        port map (
            X_1 => a_en,
            X_2 => unconnected_u11_q0_pad2,
            X_3 => a_d0,
            X_4 => a_d1,
            X_5 => unconnected_u11_q1_pad5,
            X_6 => net_n_178,
            X_7 => a_d2,
            X_8 => a_d3,
            X_9 => net_n_179,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_180,
            X_13 => a_d4,
            X_14 => a_d5,
            X_15 => net_n_181,
            X_16 => net_n_182,
            X_17 => a_d6,
            X_18 => a_d7,
            X_19 => net_n_183,
            X_20 => vcc
        );

    -- U12: 74LS377 -> SN74LS377N
    u12 : entity work.SN74LS377N
        port map (
            X_1 => a_en,
            X_2 => net_n_184,
            X_3 => a_d8,
            X_4 => a_d9,
            X_5 => net_n_185,
            X_6 => net_n_186,
            X_7 => a_d10,
            X_8 => a_d11,
            X_9 => net_n_187,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_188,
            X_13 => a_d12,
            X_14 => a_d13,
            X_15 => net_n_189,
            X_16 => net_n_190,
            X_17 => a_d14,
            X_18 => a_d15,
            X_19 => net_n_191,
            X_20 => vcc
        );

    -- U13: 74LS244 -> SN74LS244N
    u13 : entity work.SN74LS244N
        port map (
            X_1 => gnd,
            X_2 => unconnected_u13_i0a_pad2,
            X_3 => a_q7,
            X_4 => unconnected_u13_i1a_pad4,
            X_5 => a_q6,
            X_6 => net_n_178,
            X_7 => a_q5,
            X_8 => net_n_179,
            X_9 => a_q4,
            X_10 => gnd,
            X_11 => net_n_180,
            X_12 => a_q3,
            X_13 => net_n_181,
            X_14 => a_q2,
            X_15 => net_n_182,
            X_16 => a_q1,
            X_17 => net_n_183,
            X_18 => a_q0,
            X_19 => gnd,
            X_20 => vcc
        );

    -- U14: 74LS244 -> SN74LS244N
    u14 : entity work.SN74LS244N
        port map (
            X_1 => gnd,
            X_2 => net_n_184,
            X_3 => a_q15,
            X_4 => net_n_185,
            X_5 => a_q14,
            X_6 => net_n_186,
            X_7 => a_q13,
            X_8 => net_n_187,
            X_9 => a_q12,
            X_10 => gnd,
            X_11 => net_n_188,
            X_12 => a_q11,
            X_13 => net_n_189,
            X_14 => a_q10,
            X_15 => net_n_190,
            X_16 => a_q9,
            X_17 => net_n_191,
            X_18 => a_q8,
            X_19 => gnd,
            X_20 => vcc
        );

    -- U15: 74LS377 -> SN74LS377N
    u15 : entity work.SN74LS377N
        port map (
            X_1 => b_en,
            X_2 => unconnected_u15_q0_pad2,
            X_3 => a_d0,
            X_4 => a_d1,
            X_5 => unconnected_u15_q1_pad5,
            X_6 => net_n_192,
            X_7 => a_d2,
            X_8 => a_d3,
            X_9 => net_n_193,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_194,
            X_13 => a_d4,
            X_14 => a_d5,
            X_15 => net_n_195,
            X_16 => net_n_196,
            X_17 => a_d6,
            X_18 => a_d7,
            X_19 => net_n_197,
            X_20 => vcc
        );

    -- U16: 74LS377 -> SN74LS377N
    u16 : entity work.SN74LS377N
        port map (
            X_1 => b_en,
            X_2 => net_n_198,
            X_3 => a_d8,
            X_4 => a_d9,
            X_5 => net_n_199,
            X_6 => net_n_200,
            X_7 => a_d10,
            X_8 => a_d11,
            X_9 => net_n_201,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_202,
            X_13 => a_d12,
            X_14 => a_d13,
            X_15 => net_n_203,
            X_16 => net_n_204,
            X_17 => a_d14,
            X_18 => a_d15,
            X_19 => net_n_205,
            X_20 => vcc
        );

    -- U17: 74LS244 -> SN74LS244N
    u17 : entity work.SN74LS244N
        port map (
            X_1 => b_oe,
            X_2 => unconnected_u17_i0a_pad2,
            X_3 => alu_a7,
            X_4 => unconnected_u17_i1a_pad4,
            X_5 => alu_a6,
            X_6 => net_n_192,
            X_7 => alu_a5,
            X_8 => net_n_193,
            X_9 => alu_a4,
            X_10 => gnd,
            X_11 => net_n_194,
            X_12 => alu_a3,
            X_13 => net_n_195,
            X_14 => alu_a2,
            X_15 => net_n_196,
            X_16 => alu_a1,
            X_17 => net_n_197,
            X_18 => alu_a0,
            X_19 => b_oe,
            X_20 => vcc
        );

    -- U18: 74LS244 -> SN74LS244N
    u18 : entity work.SN74LS244N
        port map (
            X_1 => b_oe,
            X_2 => net_n_198,
            X_3 => alu_a15,
            X_4 => net_n_199,
            X_5 => alu_a14,
            X_6 => net_n_200,
            X_7 => alu_a13,
            X_8 => net_n_201,
            X_9 => alu_a12,
            X_10 => gnd,
            X_11 => net_n_202,
            X_12 => alu_a11,
            X_13 => net_n_203,
            X_14 => alu_a10,
            X_15 => net_n_204,
            X_16 => alu_a9,
            X_17 => net_n_205,
            X_18 => alu_a8,
            X_19 => b_oe,
            X_20 => vcc
        );

    -- U19: 74LS181 -> SN74LS181N
    u19 : entity work.SN74LS181N
        port map (
            X_1 => a_q0,
            X_2 => alu_a0,
            X_3 => alu_s3,
            X_4 => alu_s2,
            X_5 => alu_s1,
            X_6 => alu_s0,
            X_7 => alu_cin,
            X_8 => mode,
            X_9 => alu_f0,
            X_10 => alu_f1,
            X_11 => alu_f2,
            X_12 => gnd,
            X_13 => alu_f3,
            X_14 => alu_eq0,
            X_15 => net_n_206,
            X_16 => unconnected_u19_cn_4_pad16,
            X_17 => net_n_207,
            X_18 => a_q3,
            X_19 => alu_a3,
            X_20 => a_q2,
            X_21 => alu_a2,
            X_22 => a_q1,
            X_23 => alu_a1,
            X_24 => vcc
        );

    -- U20: 74LS181 -> SN74LS181N
    u20 : entity work.SN74LS181N
        port map (
            X_1 => a_q4,
            X_2 => alu_a4,
            X_3 => alu_s3,
            X_4 => alu_s2,
            X_5 => alu_s1,
            X_6 => alu_s0,
            X_7 => alu_cn_x,
            X_8 => mode,
            X_9 => alu_f4,
            X_10 => alu_f5,
            X_11 => alu_f6,
            X_12 => gnd,
            X_13 => alu_f7,
            X_14 => alu_eq1,
            X_15 => net_n_208,
            X_16 => unconnected_u20_cn_4_pad16,
            X_17 => net_n_209,
            X_18 => a_q7,
            X_19 => alu_a7,
            X_20 => a_q6,
            X_21 => alu_a6,
            X_22 => a_q5,
            X_23 => alu_a5,
            X_24 => vcc
        );

    -- U21: 74LS181 -> SN74LS181N
    u21 : entity work.SN74LS181N
        port map (
            X_1 => a_q8,
            X_2 => alu_a8,
            X_3 => alu_s3,
            X_4 => alu_s2,
            X_5 => alu_s1,
            X_6 => alu_s0,
            X_7 => alu_cn_y,
            X_8 => mode,
            X_9 => alu_f8,
            X_10 => alu_f9,
            X_11 => alu_f10,
            X_12 => gnd,
            X_13 => alu_f11,
            X_14 => alu_eq2,
            X_15 => net_n_210,
            X_16 => unconnected_u21_cn_4_pad16,
            X_17 => net_n_211,
            X_18 => a_q11,
            X_19 => alu_a11,
            X_20 => a_q10,
            X_21 => alu_a10,
            X_22 => a_q9,
            X_23 => alu_a9,
            X_24 => vcc
        );

    -- U22: 74LS181 -> SN74LS181N
    u22 : entity work.SN74LS181N
        port map (
            X_1 => a_q12,
            X_2 => alu_a12,
            X_3 => alu_s3,
            X_4 => alu_s2,
            X_5 => alu_s1,
            X_6 => alu_s0,
            X_7 => alu_cn_z,
            X_8 => mode,
            X_9 => alu_f12,
            X_10 => alu_f13,
            X_11 => alu_f14,
            X_12 => gnd,
            X_13 => alu_f15,
            X_14 => alu_eq3,
            X_15 => net_n_212,
            X_16 => unconnected_u22_cn_4_pad16,
            X_17 => net_n_213,
            X_18 => a_q15,
            X_19 => alu_a15,
            X_20 => a_q14,
            X_21 => alu_a14,
            X_22 => a_q13,
            X_23 => alu_a13,
            X_24 => vcc
        );

    -- U23: 74LS182 -> SN74LS182N
    u23 : entity work.SN74LS182N
        port map (
            X_1 => net_n_209,
            X_2 => net_n_208,
            X_3 => net_n_207,
            X_4 => net_n_206,
            X_5 => net_n_213,
            X_6 => net_n_212,
            X_7 => alu_p,
            X_8 => gnd,
            X_9 => alu_cn_z,
            X_10 => alu_g,
            X_11 => alu_cn_y,
            X_12 => alu_cn_x,
            X_13 => alu_cin,
            X_14 => net_n_211,
            X_15 => net_n_210,
            X_16 => vcc
        );

    -- U24: 74LS00 -> SN74LS00N
    u24 : entity work.SN74LS00N
        port map (
            X_1 => vcc,
            X_2 => a_d15,
            X_3 => net_n_214,
            X_4 => net_n_215,
            X_5 => net_n_216,
            X_6 => alu_of,
            X_7 => gnd,
            X_8 => open,
            X_9 => 'U',
            X_10 => 'U',
            X_11 => open,
            X_12 => 'U',
            X_13 => 'U',
            X_14 => vcc
        );

    -- U25: 74LS244 -> SN74LS244N
    u25 : entity work.SN74LS244N
        port map (
            X_1 => alu_oe,
            X_2 => alu_f0,
            X_3 => a_d7,
            X_4 => alu_f1,
            X_5 => a_d6,
            X_6 => alu_f2,
            X_7 => a_d5,
            X_8 => alu_f3,
            X_9 => a_d4,
            X_10 => gnd,
            X_11 => alu_f4,
            X_12 => a_d3,
            X_13 => alu_f5,
            X_14 => a_d2,
            X_15 => alu_f6,
            X_16 => a_d1,
            X_17 => alu_f7,
            X_18 => a_d0,
            X_19 => alu_oe,
            X_20 => vcc
        );

    -- U26: 74LS244 -> SN74LS244N
    u26 : entity work.SN74LS244N
        port map (
            X_1 => alu_oe,
            X_2 => alu_f8,
            X_3 => a_d15,
            X_4 => alu_f9,
            X_5 => a_d14,
            X_6 => alu_f10,
            X_7 => a_d13,
            X_8 => alu_f11,
            X_9 => a_d12,
            X_10 => gnd,
            X_11 => alu_f12,
            X_12 => a_d11,
            X_13 => alu_f13,
            X_14 => a_d10,
            X_15 => alu_f14,
            X_16 => a_d9,
            X_17 => alu_f15,
            X_18 => a_d8,
            X_19 => alu_oe,
            X_20 => vcc
        );

    -- U27: 74LS86 -> SN74LS86N
    u27 : entity work.SN74LS86N
        port map (
            X_1 => alu_a15,
            X_2 => a_d15,
            X_3 => net_n_215,
            X_4 => 'U',
            X_5 => 'U',
            X_6 => open,
            X_7 => gnd,
            X_8 => open,
            X_9 => 'U',
            X_10 => 'U',
            X_11 => open,
            X_12 => 'U',
            X_13 => 'U',
            X_14 => vcc
        );

    -- U28: 74LS86 -> SN74LS86N
    u28 : entity work.SN74LS86N
        port map (
            X_1 => a_q15,
            X_2 => net_n_214,
            X_3 => net_n_216,
            X_4 => 'U',
            X_5 => 'U',
            X_6 => open,
            X_7 => gnd,
            X_8 => open,
            X_9 => 'U',
            X_10 => 'U',
            X_11 => open,
            X_12 => 'U',
            X_13 => 'U',
            X_14 => vcc
        );

    -- U29: 74LS20 -> SN74LS20N
    u29 : entity work.SN74LS20N
        port map (
            X_1 => alu_eq0,
            X_2 => alu_eq1,
            X_4 => alu_eq2,
            X_5 => unconnected_u29_pad5,
            X_6 => alu_eq,
            X_7 => gnd,
            X_8 => open,
            X_9 => 'U',
            X_10 => 'U',
            X_12 => 'U',
            X_13 => 'U',
            X_14 => vcc
        );

    -- U30: 74LS02 -> SN74LS02N
    u30 : entity work.SN74LS02N
        port map (
            X_1 => alu_z,
            X_2 => alu_eql,
            X_3 => alu_eqh,
            X_4 => open,
            X_5 => 'U',
            X_6 => 'U',
            X_7 => gnd,
            X_8 => 'U',
            X_9 => 'U',
            X_10 => open,
            X_11 => 'U',
            X_12 => 'U',
            X_13 => open,
            X_14 => vcc
        );

    -- U35: 74LS377 -> SN74LS377N
    u35 : entity work.SN74LS377N
        port map (
            X_1 => ir_en,
            X_2 => unconnected_u35_q0_pad2,
            X_3 => alu_a0,
            X_4 => alu_a1,
            X_5 => unconnected_u35_q1_pad5,
            X_6 => net_n_217,
            X_7 => alu_a2,
            X_8 => alu_a3,
            X_9 => net_n_218,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_219,
            X_13 => alu_a4,
            X_14 => alu_a5,
            X_15 => net_n_220,
            X_16 => net_n_221,
            X_17 => alu_a6,
            X_18 => alu_a7,
            X_19 => net_n_222,
            X_20 => vcc
        );

    -- U36: 74LS377 -> SN74LS377N
    u36 : entity work.SN74LS377N
        port map (
            X_1 => ir_en,
            X_2 => net_n_223,
            X_3 => alu_a8,
            X_4 => alu_a9,
            X_5 => net_n_224,
            X_6 => net_n_225,
            X_7 => alu_a10,
            X_8 => alu_a11,
            X_9 => net_n_226,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_227,
            X_13 => alu_a12,
            X_14 => alu_a13,
            X_15 => net_n_228,
            X_16 => net_n_229,
            X_17 => alu_a14,
            X_18 => alu_a15,
            X_19 => net_n_230,
            X_20 => vcc
        );

    -- U37: 74LS244 -> SN74LS244N
    u37 : entity work.SN74LS244N
        port map (
            X_1 => ir_oe,
            X_2 => unconnected_u37_i0a_pad2,
            X_3 => ir_q7,
            X_4 => unconnected_u37_i1a_pad4,
            X_5 => ir_q6,
            X_6 => net_n_217,
            X_7 => ir_q5,
            X_8 => net_n_218,
            X_9 => ir_q4,
            X_10 => gnd,
            X_11 => net_n_219,
            X_12 => ir_q3,
            X_13 => net_n_220,
            X_14 => ir_q2,
            X_15 => net_n_221,
            X_16 => ir_q1,
            X_17 => net_n_222,
            X_18 => ir_q0,
            X_19 => ir_oe,
            X_20 => vcc
        );

    -- U38: 74LS244 -> SN74LS244N
    u38 : entity work.SN74LS244N
        port map (
            X_1 => ir_oe,
            X_2 => net_n_223,
            X_3 => ir_q15,
            X_4 => net_n_224,
            X_5 => ir_q14,
            X_6 => net_n_225,
            X_7 => ir_q13,
            X_8 => net_n_226,
            X_9 => ir_q12,
            X_10 => gnd,
            X_11 => net_n_227,
            X_12 => ir_q11,
            X_13 => net_n_228,
            X_14 => ir_q10,
            X_15 => net_n_229,
            X_16 => ir_q9,
            X_17 => net_n_230,
            X_18 => ir_q8,
            X_19 => ir_oe,
            X_20 => vcc
        );

    -- U39: 74LS377 -> SN74LS377N
    u39 : entity work.SN74LS377N
        port map (
            X_1 => c_en,
            X_2 => unconnected_u39_q0_pad2,
            X_3 => a_d0,
            X_4 => a_d1,
            X_5 => unconnected_u39_q1_pad5,
            X_6 => net_n_231,
            X_7 => a_d2,
            X_8 => a_d3,
            X_9 => net_n_232,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_233,
            X_13 => a_d4,
            X_14 => a_d5,
            X_15 => net_n_234,
            X_16 => net_n_235,
            X_17 => a_d6,
            X_18 => a_d7,
            X_19 => net_n_236,
            X_20 => vcc
        );

    -- U40: 74LS377 -> SN74LS377N
    u40 : entity work.SN74LS377N
        port map (
            X_1 => c_en,
            X_2 => net_n_237,
            X_3 => a_d8,
            X_4 => a_d9,
            X_5 => net_n_238,
            X_6 => net_n_239,
            X_7 => a_d10,
            X_8 => a_d11,
            X_9 => net_n_240,
            X_10 => gnd,
            X_11 => clk,
            X_12 => net_n_241,
            X_13 => a_d12,
            X_14 => a_d13,
            X_15 => net_n_242,
            X_16 => net_n_243,
            X_17 => a_d14,
            X_18 => a_d15,
            X_19 => net_n_244,
            X_20 => vcc
        );

    -- U41: 74LS244 -> SN74LS244N
    u41 : entity work.SN74LS244N
        port map (
            X_1 => c_oe,
            X_2 => unconnected_u41_i0a_pad2,
            X_3 => alu_a7,
            X_4 => unconnected_u41_i1a_pad4,
            X_5 => alu_a6,
            X_6 => net_n_231,
            X_7 => alu_a5,
            X_8 => net_n_232,
            X_9 => alu_a4,
            X_10 => gnd,
            X_11 => net_n_233,
            X_12 => alu_a3,
            X_13 => net_n_234,
            X_14 => alu_a2,
            X_15 => net_n_235,
            X_16 => alu_a1,
            X_17 => net_n_236,
            X_18 => alu_a0,
            X_19 => c_oe,
            X_20 => vcc
        );

    -- U42: 74LS244 -> SN74LS244N
    u42 : entity work.SN74LS244N
        port map (
            X_1 => c_oe,
            X_2 => net_n_237,
            X_3 => alu_a15,
            X_4 => net_n_238,
            X_5 => alu_a14,
            X_6 => net_n_239,
            X_7 => alu_a13,
            X_8 => net_n_240,
            X_9 => alu_a12,
            X_10 => gnd,
            X_11 => net_n_241,
            X_12 => alu_a11,
            X_13 => net_n_242,
            X_14 => alu_a10,
            X_15 => net_n_243,
            X_16 => alu_a9,
            X_17 => net_n_244,
            X_18 => alu_a8,
            X_19 => c_oe,
            X_20 => vcc
        );

    -- U45: 74LS377 -> SN74LS377N
    u45 : entity work.SN74LS377N
        port map (
            X_1 => alu_of,
            X_2 => pc_ld,
            X_3 => ir_q0,
            X_4 => ir_q1,
            X_5 => pc_inc,
            X_6 => pc_oe,
            X_7 => ir_q2,
            X_8 => ir_q3,
            X_9 => ir_en,
            X_10 => unconnected_u45_gnd_pad10,
            X_11 => alu_eq,
            X_12 => ir_oe,
            X_13 => ir_q4,
            X_14 => ir_q5,
            X_15 => mar_en,
            X_16 => ram_we,
            X_17 => ir_q6,
            X_18 => ir_q7,
            X_19 => ram_oe,
            X_20 => unconnected_u45_vcc_pad20
        );

    -- U46: 74LS377 -> SN74LS377N
    u46 : entity work.SN74LS377N
        port map (
            X_1 => alu_of,
            X_2 => b_en,
            X_3 => ir_q8,
            X_4 => ir_q9,
            X_5 => b_oe,
            X_6 => c_en,
            X_7 => ir_q10,
            X_8 => ir_q11,
            X_9 => c_oe,
            X_10 => unconnected_u46_gnd_pad10,
            X_11 => alu_eq,
            X_12 => alu_en,
            X_13 => ir_q12,
            X_14 => ir_q13,
            X_15 => alu2b,
            X_16 => alu_oe,
            X_17 => ir_q14,
            X_18 => ir_q15,
            X_19 => unconnected_u46_q7_pad19,
            X_20 => unconnected_u46_vcc_pad20
        );

    -- U43: 74LS244 -> SN74LS244N
    u43 : entity work.SN74LS244N
        port map (
            X_1 => alu2b,
            X_2 => a_d0,
            X_3 => alu_a7,
            X_4 => a_d1,
            X_5 => alu_a6,
            X_6 => a_d2,
            X_7 => alu_a5,
            X_8 => a_d3,
            X_9 => alu_a4,
            X_10 => gnd,
            X_11 => a_d4,
            X_12 => alu_a3,
            X_13 => a_d5,
            X_14 => alu_a2,
            X_15 => a_d6,
            X_16 => alu_a1,
            X_17 => a_d7,
            X_18 => alu_a0,
            X_19 => alu2b,
            X_20 => vcc
        );

    -- U44: 74LS244 -> SN74LS244N
    u44 : entity work.SN74LS244N
        port map (
            X_1 => alu2b,
            X_2 => a_d8,
            X_3 => alu_a15,
            X_4 => a_d9,
            X_5 => alu_a14,
            X_6 => a_d10,
            X_7 => alu_a13,
            X_8 => a_d11,
            X_9 => alu_a12,
            X_10 => gnd,
            X_11 => a_d12,
            X_12 => alu_a11,
            X_13 => a_d13,
            X_14 => alu_a10,
            X_15 => a_d14,
            X_16 => alu_a9,
            X_17 => a_d15,
            X_18 => alu_a8,
            X_19 => alu2b,
            X_20 => vcc
        );

end architecture structural;
