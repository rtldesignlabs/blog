library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crosslink_blinky_tb is
end entity crosslink_blinky_tb;

architecture behavioral of crosslink_blinky_tb is

    signal reset : std_logic;
    signal led : std_logic;

begin

    crosslink_blinky_inst : entity work.crosslink_blinky
        port map (
            i_reset => reset,
            o_led => led
        );

    stimuli : process
    begin
        reset <= '0';
        wait for 1 ns;
        reset <= '1';
        wait for 75 ns;
        reset <= '0';
        wait;
    end process stimuli;

end architecture behavioral;