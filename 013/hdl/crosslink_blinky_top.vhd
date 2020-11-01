library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lifmd;
use lifmd.components.all;

entity crosslink_blinky is
    port (
		o_led   : out	std_logic
    );
end entity crosslink_blinky;

architecture rtl of crosslink_blinky is

    signal reset : std_logic;

    -- Oscillator
    component OSCI
        generic (
            HFCLKDIV    : integer
        );
        port (
            HFOUTEN     : in STD_LOGIC;
            HFCLKOUT    : out STD_LOGIC;
            LFCLKOUT    : out STD_LOGIC
        );
    end component;
    signal clock_48 : std_logic;

    -- PLL
    signal pll_lock : std_logic;
    signal clock_96 : std_logic;

    -- Counter
    signal counter : unsigned (31 downto 0);
    signal led : std_logic;

begin

    reset <= not pll_lock;

    osci_inst : OSCI
        generic map (
            HFCLKDIV    => 1
        )
        port map (
            HFOUTEN     => '1',
            HFCLKOUT    => clock_48,
            LFCLKOUT    => open
        );

    pll_inst : entity work.pll
        port map (
            RST     => '0',
            CLKI    => clock_48,
            CLKOP   => clock_96,
            LOCK    => pll_lock
        );

    leds_counter : process (clock_96)
    begin
        if (rising_edge(clock_96)) then
            if (reset = '1') then
                counter <= (others => '0');
                led <= '0';
            else
                if (pll_lock = '1') then
                    counter <= counter + 1;
                    if (counter = 9999) then
                        counter <= (others => '0');
                        led <= not led;
                    end if;
                end if;
            end if;
        end if;
    end process leds_counter;
    o_led <= led;

end architecture rtl;