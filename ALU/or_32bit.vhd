----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2022 00:12:12
-- Design Name: 
-- Module Name: or_32bit - dataflow
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

entity or_32bit is
  Port (
  a_in : in std_logic_vector(31 downto 0);  --operand 1
  b_in : in std_logic_vector(31 downto 0);  -- operand 2
  result : out std_logic_vector(31 downto 0) -- result
   );
end or_32bit;

architecture dataflow of or_32bit is
begin
    result <= a_in or b_in;
end dataflow;
