LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.ALU_pkg.ALL;

ENTITY Carry_Select_Adder_32Bit IS
    PORT (
        X : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        Y : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        CARRY_IN : IN STD_LOGIC;
        SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        CARRY_OUT : OUT STD_LOGIC;
        OVERFLOW : OUT STD_LOGIC
    );
END Carry_Select_Adder_32Bit;

ARCHITECTURE Behavioral OF Carry_Select_Adder_32Bit IS

    SIGNAL A, B, C0, C1 : STD_LOGIC_VECTOR(0 TO 31);
    SIGNAL OF0, OF1 : STD_LOGIC;

BEGIN

    Gen : FOR I IN 0 TO 31 GENERATE
        FirstBlock : IF I = 0 GENERATE
            FA : Full_Adder PORT MAP(A => X(I), B => Y(I), Cin => '0', S => A(I), Cout => C0(I));
            FA_2 : Full_Adder PORT MAP(A => X(I), B => Y(I), Cin => '1', S => B(I), Cout => C1(I));
            Mux : Mux2_1 PORT MAP(A => A(I), B => B(I), S => CARRY_IN, Y => SUM(I));
        END GENERATE FirstBlock;

        LaterBlocks : IF I > 0 GENERATE
            FA : Full_Adder PORT MAP(A => X(I), B => Y(I), Cin => C0(I - 1), S => A(I), Cout => C0(I));
            FA_2 : Full_Adder PORT MAP(A => X(I), B => Y(I), Cin => C1(I - 1), S => B(I), Cout => C1(I));
            Mux : Mux2_1 PORT MAP(A => A(I), B => B(I), S => CARRY_IN, Y => SUM(I));
        END GENERATE LaterBlocks;

    END GENERATE Gen;

    MUX_Res : Mux2_1 PORT MAP(A => C0(31), B => C1(31), S => CARRY_IN, Y => CARRY_OUT);
    -- Overflow Detection
    OF0 <= C0(31) XOR C0(30);
    OF1 <= C1(31) XOR C1(30);

    MUX_Overflow : Mux2_1 PORT MAP(A => OF0, B => OF1, S => CARRY_IN, Y => OVERFLOW);

END Behavioral;