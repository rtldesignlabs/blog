library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zedboard_audio_top is
    port (
        i_clock             : in    std_logic;
        i_reset             : in    std_logic;
        -- SPI interface
        o_spi_clock         : out   std_logic;
        o_spi_cs            : out   std_logic_vector(0 downto 0);
        o_spi_mosi          : out   std_logic;
        i_spi_miso          : in    std_logic;
        -- I2S interface
        o_i2s_mclock        : out   std_logic;
        o_i2s_bclock        : out   std_logic;
        o_i2s_lrclock       : out   std_logic;
        o_i2s_dac_sdata     : out   std_logic;
        i_i2s_adc_sdata     : in    std_logic;
        -- PS IO
        DDR_addr            : inout std_logic_vector(14 downto 0);
        DDR_ba              : inout std_logic_vector(2 downto 0);
        DDR_cas_n           : inout std_logic;
        DDR_ck_n            : inout std_logic;
        DDR_ck_p            : inout std_logic;
        DDR_cke             : inout std_logic;
        DDR_cs_n            : inout std_logic;
        DDR_dm              : inout std_logic_vector(3 downto 0);
        DDR_dq              : inout std_logic_vector(31 downto 0);
        DDR_dqs_n           : inout std_logic_vector(3 downto 0);
        DDR_dqs_p           : inout std_logic_vector(3 downto 0);
        DDR_odt             : inout std_logic;
        DDR_ras_n           : inout std_logic;
        DDR_reset_n         : inout std_logic;
        DDR_we_n            : inout std_logic;
        FIXED_IO_ddr_vrn    : inout std_logic;
        FIXED_IO_ddr_vrp    : inout std_logic;
        FIXED_IO_mio        : inout std_logic_vector(53 downto 0);
        FIXED_IO_ps_clk     : inout std_logic;
        FIXED_IO_ps_porb    : inout std_logic;
        FIXED_IO_ps_srstb   : inout std_logic
    );
end entity zedboard_audio_top;

architecture structural of zedboard_audio_top is

    signal aux_clock : std_logic;

begin



    spi_inst : entity work.audio_bd_wrapper
        port map (
                DDR_addr            => DDR_addr,
                DDR_ba              => DDR_ba,
                DDR_cas_n           => DDR_cas_n,
                DDR_ck_n            => DDR_ck_n,
                DDR_ck_p            => DDR_ck_p,
                DDR_cke             => DDR_cke,
                DDR_cs_n            => DDR_cs_n,
                DDR_dm              => DDR_dm,
                DDR_dq              => DDR_dq,
                DDR_dqs_n           => DDR_dqs_n,
                DDR_dqs_p           => DDR_dqs_p,
                DDR_odt             => DDR_odt,
                DDR_ras_n           => DDR_ras_n,
                DDR_reset_n         => DDR_reset_n,
                DDR_we_n            => DDR_we_n,
                FIXED_IO_ddr_vrn    => FIXED_IO_ddr_vrn,
                FIXED_IO_ddr_vrp    => FIXED_IO_ddr_vrp,
                FIXED_IO_mio        => FIXED_IO_mio,
                FIXED_IO_ps_clk     => FIXED_IO_ps_clk,
                FIXED_IO_ps_porb    => FIXED_IO_ps_porb,
                FIXED_IO_ps_srstb   => FIXED_IO_ps_srstb,
                aud_mclk_0          => i_clock,
                aud_mrst_0          => i_reset,
                io0_o_0             => o_spi_mosi,
                io1_i_0             => i_spi_miso,
                lrclk_out_0         => o_i2s_lrclock,
                sck_o_0             => o_spi_clock,
                sclk_out_0          => aux_clock,
                sdata_0_in_0        => i_i2s_adc_sdata,
                sdata_0_out_0       => o_i2s_dac_sdata,
                ss_o_0              => o_spi_cs
            );
    o_i2s_mclock <= aux_clock;
    o_i2s_bclock <= aux_clock;

end structural;