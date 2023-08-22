----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2022 22:55:14
-- Design Name: 
-- Module Name: MUX8x1 - Behavioral
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

entity mux_8to1 is
  Port (
  in0,in1,in2,in3,in4,in5,in6,in7:in std_logic_vector(31 downto 0);
  sel :in std_logic_vector(2 downto 0);
  y: out std_logic_vector(31 downto 0)
   );
end mux_8to1;

architecture Behavioral of mux_8to1 is
begin
    process(sel,in0,in1,in2,in3,in4,in5,in6,in7)
    begin
        case sel is
        when "000" =>y<=in0;   -- send 0 signal out
        when "001" =>y<=in1;   -- send 1 signal out
        when "010" =>y<=in2;   -- send 2 signal out
        when "011" =>y<=in3;   -- send 3 signal out
        when "100" =>y<=in4;   --  send 4 signal out   
        when "101" =>y<=in5;   -- send 5 signal out
        when "110" =>y<=in6;   -- send 6 signal out
        when "111" =>y<=in7;   -- send 7 signal out
        when others => y <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
      end case;
     end process;
end Behavioral;
