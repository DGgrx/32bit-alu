LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY full_adder IS
    PORT (
        a, b, cin : IN STD_LOGIC;
        s, cout : OUT STD_LOGIC

    );
END full_adder;

ARCHITECTURE behavior OF full_adder IS

BEGIN

    s <= a XOR b XOR cin;
    cout <= (a AND b) OR (cin AND (a XOR b));

END behavior;