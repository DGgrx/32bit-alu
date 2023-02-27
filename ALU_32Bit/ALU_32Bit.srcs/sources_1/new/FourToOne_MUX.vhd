LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FourToOne_MUX IS
    PORT (
        A, B, C, D : IN STD_LOGIC_VECTOR (0 TO 31);
        S : IN STD_LOGIC_VECTOR (0 TO 1);
        Y : OUT STD_LOGIC_VECTOR (0 TO 31)
    );
END FourToOne_MUX;

ARCHITECTURE DataFlow OF FourToOne_MUX IS
BEGIN

    PROCESS
    BEGIN
        IF S <= "00" THEN
            Y <= A;
        ELSIF S <= "01" THEN
            Y <= B;
        ELSIF S <= "10" THEN
            Y <= C;
        ELSIF S <= "11" THEN
            Y <= D;
        END IF;

    END PROCESS;

END DataFlow;