library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_100div is
    Port ( CLK : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end clk_100div;

architecture Behavioral of clk_100div is
    signal count : INTEGER range 0 to 1000 := 0;
	 signal clk_buf : STD_LOGIC := '0';
    
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if (count = 500) then
                clk_buf <= not clk_buf;
                count <= 0; -- Reset count to 0
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    CLK_OUT <= clk_buf;
end Behavioral;
