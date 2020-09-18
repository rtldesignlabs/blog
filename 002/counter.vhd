library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    generic (
        COUNTER_WIDTH   : integer := 16
    );
    port (
        i_clock         : in    std_logic;
        i_reset         : in    std_logic;
        i_enable        : in    std_logic;
        o_counter       : out   std_logic_vector(COUNTER_WIDTH-1 downto 0)
    );
end entity counter;

architecture rtl of counter is

    signal counter : unsigned(COUNTER_WIDTH-1 downto 0);

begin

    counter_p : process (i_clock)
    begin
        if (rising_edge(i_clock)) then
            if (i_reset = '1') then
                counter <= (others => '0');
            else
                if (i_enable = '1') then
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process counter_p;
    o_counter <= std_logic_vector(counter);

end architecture rtl;