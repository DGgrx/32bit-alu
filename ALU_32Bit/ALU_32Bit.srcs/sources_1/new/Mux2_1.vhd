LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux2_1 IS
    PORT (

        A, B : IN STD_LOGIC;
        S : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END Mux2_1;

ARCHITECTURE bhv OF Mux2_1 IS
BEGIN
    PROCESS (A, B, S)
    BEGIN
        IF S = '0' THEN
            Y <= A;
        ELSE
            Y <= B;
        END IF;
    END PROCESS;
END bhv;