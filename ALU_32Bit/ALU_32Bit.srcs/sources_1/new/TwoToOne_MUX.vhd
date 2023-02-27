LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TwoToOne_MUX IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR (0 TO 31);
        S : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (0 TO 31)
    );
END TwoToOne_MUX;

ARCHITECTURE DataFlow OF TwoToOne_MUX IS
BEGIN
    PROCESS (A, B, S)
    BEGIN
        IF S <= '0' THEN
            Y <= A;
        ELSIF S <= '1' THEN
            Y <= B;
        END IF;
    END PROCESS;

END DataFlow;