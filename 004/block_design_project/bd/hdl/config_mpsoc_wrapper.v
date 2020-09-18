//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
//Date        : Sun May 10 17:53:28 2020
//Host        : DESKTOP-V0T19C3 running 64-bit major release  (build 9200)
//Command     : generate_target config_mpsoc_wrapper.bd
//Design      : config_mpsoc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module config_mpsoc_wrapper
   (clk_300mhz_clk_n,
    clk_300mhz_clk_p,
    ddr4_sdram_act_n,
    ddr4_sdram_adr,
    ddr4_sdram_ba,
    ddr4_sdram_bg,
    ddr4_sdram_ck_c,
    ddr4_sdram_ck_t,
    ddr4_sdram_cke,
    ddr4_sdram_cs_n,
    ddr4_sdram_dm_n,
    ddr4_sdram_dq,
    ddr4_sdram_dqs_c,
    ddr4_sdram_dqs_t,
    ddr4_sdram_odt,
    ddr4_sdram_reset_n,
    dip_switch_4bits_tri_i,
    led_4bits_tri_o,
    push_button_4bits_tri_i,
    reset,
    uart2_pl_rxd,
    uart2_pl_txd);
  input clk_300mhz_clk_n;
  input clk_300mhz_clk_p;
  output ddr4_sdram_act_n;
  output [16:0]ddr4_sdram_adr;
  output [1:0]ddr4_sdram_ba;
  output [1:0]ddr4_sdram_bg;
  output ddr4_sdram_ck_c;
  output ddr4_sdram_ck_t;
  output ddr4_sdram_cke;
  output ddr4_sdram_cs_n;
  inout [7:0]ddr4_sdram_dm_n;
  inout [63:0]ddr4_sdram_dq;
  inout [7:0]ddr4_sdram_dqs_c;
  inout [7:0]ddr4_sdram_dqs_t;
  output ddr4_sdram_odt;
  output ddr4_sdram_reset_n;
  input [3:0]dip_switch_4bits_tri_i;
  output [3:0]led_4bits_tri_o;
  input [3:0]push_button_4bits_tri_i;
  input reset;
  input uart2_pl_rxd;
  output uart2_pl_txd;

  wire clk_300mhz_clk_n;
  wire clk_300mhz_clk_p;
  wire ddr4_sdram_act_n;
  wire [16:0]ddr4_sdram_adr;
  wire [1:0]ddr4_sdram_ba;
  wire [1:0]ddr4_sdram_bg;
  wire ddr4_sdram_ck_c;
  wire ddr4_sdram_ck_t;
  wire ddr4_sdram_cke;
  wire ddr4_sdram_cs_n;
  wire [7:0]ddr4_sdram_dm_n;
  wire [63:0]ddr4_sdram_dq;
  wire [7:0]ddr4_sdram_dqs_c;
  wire [7:0]ddr4_sdram_dqs_t;
  wire ddr4_sdram_odt;
  wire ddr4_sdram_reset_n;
  wire [3:0]dip_switch_4bits_tri_i;
  wire [3:0]led_4bits_tri_o;
  wire [3:0]push_button_4bits_tri_i;
  wire reset;
  wire uart2_pl_rxd;
  wire uart2_pl_txd;

  config_mpsoc config_mpsoc_i
       (.clk_300mhz_clk_n(clk_300mhz_clk_n),
        .clk_300mhz_clk_p(clk_300mhz_clk_p),
        .ddr4_sdram_act_n(ddr4_sdram_act_n),
        .ddr4_sdram_adr(ddr4_sdram_adr),
        .ddr4_sdram_ba(ddr4_sdram_ba),
        .ddr4_sdram_bg(ddr4_sdram_bg),
        .ddr4_sdram_ck_c(ddr4_sdram_ck_c),
        .ddr4_sdram_ck_t(ddr4_sdram_ck_t),
        .ddr4_sdram_cke(ddr4_sdram_cke),
        .ddr4_sdram_cs_n(ddr4_sdram_cs_n),
        .ddr4_sdram_dm_n(ddr4_sdram_dm_n),
        .ddr4_sdram_dq(ddr4_sdram_dq),
        .ddr4_sdram_dqs_c(ddr4_sdram_dqs_c),
        .ddr4_sdram_dqs_t(ddr4_sdram_dqs_t),
        .ddr4_sdram_odt(ddr4_sdram_odt),
        .ddr4_sdram_reset_n(ddr4_sdram_reset_n),
        .dip_switch_4bits_tri_i(dip_switch_4bits_tri_i),
        .led_4bits_tri_o(led_4bits_tri_o),
        .push_button_4bits_tri_i(push_button_4bits_tri_i),
        .reset(reset),
        .uart2_pl_rxd(uart2_pl_rxd),
        .uart2_pl_txd(uart2_pl_txd));
endmodule
