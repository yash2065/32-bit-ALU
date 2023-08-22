----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2022 22:12:54
-- Design Name: 
-- Module Name: ALU32 - Behavioral
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

entity ALU32 is
  Port (
  a : in std_logic_vector(31 downto 0);  --operand 1
  b : in std_logic_vector(31 downto 0);  --operand 2
  operation : in std_logic_vector(2 downto 0);  -- operation selection
  result : out std_logic_vector(31 downto 0);  --result
  carry_out : out std_logic;  --carry out flag
  zero : out std_logic  --zero flag
  );
end ALU32;

architecture Behavioral of ALU32 is
  -- Internal components
  
  -- 32-bit Adder
  component adder_32bit is
    Port ( 
    a_in : in std_logic_vector(31 downto 0);  --operand 1
    b_in : in std_logic_vector(31 downto 0);  -- operand 2
    c_in : in std_logic;                      -- carry in (may be from previous stage)
    result : out std_logic_vector(31 downto 0); -- result
    c_out : out std_logic                     -- carry out (for program status reister)
    );
  end component;
  
  -- 32-bit AND GATE
  component and_32bit is
    Port (
    a_in : in std_logic_vector(31 downto 0);  --operand 1
    b_in : in std_logic_vector(31 downto 0);  -- operand 2
    result : out std_logic_vector(31 downto 0) -- result
     );
  end component;
  
  --32-BIT OR GATE
  component or_32bit is
    Port (
    a_in : in std_logic_vector(31 downto 0);  --operand 1
    b_in : in std_logic_vector(31 downto 0);  -- operand 2
    result : out std_logic_vector(31 downto 0) -- result
     );
  end component;
  
  -- 32-BIT LOGICAL SHIFT RIGHT
  component right_shift_32bit is
    Port (
    a_in : in std_logic_vector(31 downto 0);  -- operand
    result : out std_logic_vector(31 downto 0) -- result
     );
  end component;
  
  -- 32-BIT LOGICAL SHIFT LEFT
  component left_shift_32bit is
    Port (
    a_in : in std_logic_vector(31 downto 0);  -- operand
    result : out std_logic_vector(31 downto 0) -- result
     );
  end component;
  
  -- 32-BIT 8X1 MULTIPLEXER
  component mux_8to1 is
    Port (
    in0,in1,in2,in3,in4,in5,in6,in7 :in std_logic_vector(31 downto 0);
    sel :in std_logic_vector(2 downto 0);
    y: out std_logic_vector(31 downto 0)
     );
  end component;
  
  -- 32-BIT 2X1 MULTIPLEXER
  -- used in not gate
  component mux_2to1 is
    Port (
    in0, in1 : in std_logic_vector(31 downto 0);  --Mux input signal choices
    sel : in std_logic;  --select
    y : out std_logic_vector(31 downto 0)  -- Mux output signal
     );
  end component;
  
  -- 32-BIT NOT GATE
  component not_32bit is
    Port (
      x : in std_logic_vector(31 downto 0);  -- Input signal
      y : out std_logic_vector(31 downto 0) -- output signal
     );
  end component;
  
  -- Internal wires
  signal andResult : std_logic_vector(31 downto 0);
  signal orResult : std_logic_vector(31 downto 0);
  signal adderResult : std_logic_vector(31 downto 0);
  signal lslResult : std_logic_vector(31 downto 0);
  signal lsrResult : std_logic_vector(31 downto 0);
  signal bNegOrNot : std_logic_vector(31 downto 0);
  signal bNot : std_logic_vector(31 downto 0);

begin
    -- connect the 8x1 multiplexer
    mux1: mux_8to1 port map(in0  => andResult,
                            in1  => orResult,
                            in2  => adderResult,
                            in3  => "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ",
                            in4  => lslResult,
                            in5  => lsrResult,
                            in6  => adderResult,
                            in7  => "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ",
                            sel  => operation,
                            y  => result);
    -- connect the 32-bit adder
    adder1: adder_32bit port map(a_in   => a,
                                 b_in   => bNegOrNot,
                                 c_in   => operation(2),
                                 result => adderResult,
                                 c_out  => carry_out);
    
    -- connect the 32-bit AND GATE
    and1: and_32bit port map(a,b,andResult);
    -- connect the 32-bit OR GATE
    or1: or_32bit port map(a,b,orResult);
    -- connect the 32-bit LOGICAL SHIFT RIGHT
    lsr1: right_shift_32bit port map(a,lsrResult);
    -- connect the 32-bit LOGICAL SHIFT LEFT
    lsl1: left_shift_32bit port map(a,lslResult);
    -- connect the b negative decider mux
    negMux: mux_2to1  port map(in0  => b,
                               in1  => bNot,
                               sel  => operation(2),
                               y    => bNegOrNot);
    -- connect the 32-bit OR GATE
    notber: not_32bit   port map(b,bNot);
                              
end Behavioral;
