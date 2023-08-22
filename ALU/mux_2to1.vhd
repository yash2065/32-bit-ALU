----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2022 00:32:03
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2to1 is
  Port (
  in0, in1 : in std_logic_vector(31 downto 0);  --Mux input signal choices
  sel : in std_logic;  --select
  y : out std_logic_vector(31 downto 0)  -- Mux output signal
   );
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
    process(sel,in0,in1)
    begin
        case sel is
            when '0' => y <= in0;  -- send 0 signal out
            when '1' => y <= in1;  -- send 1 signal out
            when others => y <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
        end case;
    end process;
end Behavioral;
