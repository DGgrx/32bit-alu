LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.ALU_pkg.Mux2_1;

ENTITY LRS IS
    PORT (
        A : IN STD_LOGIC_VECTOR(0 TO 31);
        Y : OUT STD_LOGIC_VECTOR(0 TO 31)
    );
END LRS;

ARCHITECTURE Behavioral OF LRS IS

BEGIN
    Gen : FOR I IN 0 TO 31 GENERATE
        LSB : IF I = 0 GENERATE

            MUX : Mux2_1 PORT MAP(A => A(I), B => A(I + 1), S => '1', Y => Y(I));
        END GENERATE LSB;

        Bits : IF I > 0 AND I < 31 GENERATE

            MUX : Mux2_1 PORT MAP(A => A(I), B => A(I + 1), S => '1', Y => Y(I));
        END GENERATE Bits;

        MSB : IF I = 31 GENERATE

            MUX : Mux2_1 PORT MAP(A => A(I), B => '0', S => '1', Y => Y(I));
        END GENERATE MSB;
    END GENERATE Gen;

END Behavioral;