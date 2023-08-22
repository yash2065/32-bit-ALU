----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2022 23:18:47
-- Design Name: 
-- Module Name: fullAdder - DataFlow
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

entity fullAdder is
 Port ( 
 
  a:in std_logic;  --operand 1
  b:in std_logic;   --operand 2
  cin:in std_logic;   -- carry in (maybe from previous stage)
  sum:out std_logic;   -- result
  cout:out std_logic);  --carry out (maybe for next stage)
end fullAdder;

architecture DataFlow of fullAdder is

begin
sum<=(a xor b) xor cin;
cout<=(a and b) or ((a xor b) and cin);

end DataFlow;
