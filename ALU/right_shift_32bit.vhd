----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2022 00:16:26
-- Design Name: 
-- Module Name: right_shift_32bit - Behavioral
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

entity right_shift_32bit is
  Port (
  a_in : in std_logic_vector(31 downto 0);  -- operand
  result : out std_logic_vector(31 downto 0) -- result
   );
end right_shift_32bit;

architecture Behavioral of right_shift_32bit is
begin
    result(30 downto 0) <= a_in(31 downto 1);
    result(31) <= '0';
end Behavioral;
