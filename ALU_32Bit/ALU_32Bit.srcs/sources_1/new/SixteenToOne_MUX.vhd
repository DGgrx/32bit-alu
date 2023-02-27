LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SixteenToOne_MUX IS
    PORT (
        A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Y : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END SixteenToOne_MUX;

ARCHITECTURE Structural OF SixteenToOne_MUX IS
    COMPONENT FourToOne_MUX IS
        PORT (
            A, B, C, D : IN STD_LOGIC_VECTOR (0 TO 31);
            S : IN STD_LOGIC_VECTOR (0 TO 1);
            Y : OUT STD_LOGIC_VECTOR (0 TO 31)
        );
    END COMPONENT;
    SIGNAL y0, y1, y2, y3 : STD_LOGIC_VECTOR (0 TO 31);
BEGIN
    U1 : FourToOne_MUX PORT MAP(A => A, B => E, C => I, D => M, S(0) => S(0), S(1) => S(1), Y => y0);
    U2 : FourToOne_MUX PORT MAP(A => B, B => F, C => J, D => N, S(0) => S(0), S(1) => S(1), Y => y1);
    U3 : FourToOne_MUX PORT MAP(A => C, B => G, C => K, D => O, S(0) => S(0), S(1) => S(1), Y => y2);
    U4 : FourToOne_MUX PORT MAP(A => D, B => H, C => L, D => P, S(0) => S(0), S(1) => S(1), Y => y3);
    U5 : FourToOne_MUX PORT MAP(A => y0, B => y1, C => y2, D => y3, S(0) => S(2), S(1) => S(3), Y => Y);

END Structural;