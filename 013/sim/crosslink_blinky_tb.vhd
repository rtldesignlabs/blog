library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crosslink_blinky_tb is
end entity crosslink_blinky_tb;

architecture behavioral of crosslink_blinky_tb is

    signal led : std_logic;

begin

    crosslink_blinky_inst : entity work.crosslink_blinky
        port map (
            o_led => led
        );

    stimuli : process
    begin
        wait;
    end process stimuli;

end architecture behavioral;