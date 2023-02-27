library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
--Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
component ALU_32Bit is 
Port (
        A,B:in std_logic_vector(0 to 31);
        Ainv,Binv: in std_logic;
        Cin: in std_logic;
        ALU_Op: in std_logic_vector(0 to 3);
        Co: out std_logic;
        Overflow: out std_logic;
        Y:out std_logic_vector(0 to 31)        
    );
    end component;
    
    signal A,B:std_logic_vector(0 to 31);
       signal Ainv,Binv: std_logic;
       signal Cin: std_logic;
       signal ALU_Op: std_logic_vector(0 to 3);
       signal Co: std_logic;
       signal Overflow: std_logic;
       signal Y: std_logic_vector(0 to 31);
begin

uut: ALU_32Bit port map(A=>A,B=>B,Ainv=>Ainv,Binv=>Binv,Cin=>Cin,ALU_op=>ALU_Op,Co=>Co,Overflow=>Overflow,Y=>Y);

stim_proc: process
begin
    wait for 100ns;

    -- OR Operation
    Ainv<='0';
    Binv<='0';
    Cin<='0';
    ALU_Op<="0011";
    A<="00101101010011010110101011010000";
    B<="10011001000110011011100101110101";
    --Y= ""
    
    wait for 100ns;
    
    -- NAND Operation
    Ainv<='1';
    Binv<='1';
    Cin<='0';
    ALU_Op<="0011";
    
    wait for 100ns;
    --and 
    Ainv<='0';
    binv<='0';
    cin<='0';
    ALU_Op<="0010";
    
    wait for 100ns;

wait;
end process;

end Behavioral;
