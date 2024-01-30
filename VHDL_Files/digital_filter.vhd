----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2023 01:06:18
-- Design Name: 
-- Module Name: digital_filter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity digital_filter is
    Port ( CLK : in STD_LOGIC;
           EN : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (11 downto 0));
end digital_filter;

architecture Behavioral of digital_filter is

component filter is
    Port ( EN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           INPUT_ADC : in STD_LOGIC_VECTOR (11 downto 0);
           OUTPUT_FILTERED : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component clk_100div is
    Port ( CLK : in STD_LOGIC;
           CLK_OUT : out STD_LOGIC);
end component clk_100div;

component adc is
	port (
		CLOCK : in  std_logic                     := '0'; --      clk.clk
		CH0   : out std_logic_vector(11 downto 0);        -- readings.CH0
		CH1   : out std_logic_vector(11 downto 0);        --         .CH1
		CH2   : out std_logic_vector(11 downto 0);        --         .CH2
		CH3   : out std_logic_vector(11 downto 0);        --         .CH3
		CH4   : out std_logic_vector(11 downto 0);        --         .CH4
		CH5   : out std_logic_vector(11 downto 0);        --         .CH5
		CH6   : out std_logic_vector(11 downto 0);        --         .CH6
		CH7   : out std_logic_vector(11 downto 0);        --         .CH7
		RESET : in  std_logic                     := '0'  --    reset.reset
	);
end component adc;

signal INPUT : STD_LOGIC_VECTOR (11 downto 0);
signal ADC_CLK : STD_LOGIC;

begin

div_0 : clk_100div 
			port map (
			CLK => CLK,
			CLK_OUT => ADC_CLK
			);
filter_hpf : filter
        port map ( CLK => ADC_CLK,
               EN => EN,
               INPUT_ADC => INPUT,
               OUTPUT_FILTERED => OUTPUT);
adc_0 : adc 
			port map (
			CLOCK => CLK,
			CH0 => INPUT
			);
--OUTPUT <= INPUT;
end Behavioral;
