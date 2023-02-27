LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.ALU_pkg.ALL;

ENTITY ALU_32Bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(0 TO 31);
        Ainv, Binv : IN STD_LOGIC;
        Cin : IN STD_LOGIC;
        ALU_Op : IN STD_LOGIC_VECTOR(0 TO 3);
        Co : OUT STD_LOGIC;
        Overflow : OUT STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR(0 TO 31)
    );
END ALU_32Bit;

ARCHITECTURE Behavioral OF ALU_32Bit IS

    SIGNAL y_a, y_b, y_and, y_or, y_xor, y_xnor : STD_LOGIC_VECTOR(0 TO 31);
    SIGNAL y_anot, y_bnot, y_sum, y_lls, y_lrs : STD_LOGIC_VECTOR(0 TO 31);
    SIGNAL y_ars, y_als : STD_LOGIC_VECTOR(0 TO 31);

BEGIN

    -- NOT Operation
    y_anot <= NOT A;
    y_bnot <= NOT B;

    -- Ainv , Binv Operations
    AMX : TwoToOne_Mux PORT MAP(A => A, B => y_anot, S => Ainv, Y => y_a);
    BMX : TwoToOne_Mux PORT MAP(A => B, B => y_bnot, S => Binv, Y => y_b);
    -- AND and OR Gate
    y_and <= y_a AND y_b;
    y_or <= y_a OR y_b;

    -- XOR and XNOR Operations
    y_xor <= y_a XOR y_b;
    y_xnor <= y_a XNOR y_b;

    -- Carry Save Adder with Overflow Detection
    Adder : Carry_Select_Adder_32Bit PORT MAP(
        X => y_a, Y => y_b, CARRY_IN => Cin,
        SUM => y_sum, CARRY_OUT => Co, OVERFLOW => Overflow);

    --Logical Left Shift
    LLSU : LLS PORT MAP(A => A, Y => y_lls);

    --Logical Right Shift
    LRSU : LRS PORT MAP(A => A, Y => y_lrs);

    --Arithematic Left Shift 
    ALSU : ALS PORT MAP(A => A, Y => y_als);

    --Arithematic Right Shift
    ARSU : ARS PORT MAP(A => A, Y => y_ars);

    --ALU_Op
    Mux_Res : SixteenToOne_MUX PORT MAP(
        A => y_anot, B => y_bnot, C => y_and,
        D => y_or, E => y_xor, F => y_xnor, G => y_sum, H => y_lls, I => y_lrs, J => y_als, K => y_ars,
        L => "00000000000000000000000000000000", M => "00000000000000000000000000000000",
        N => "00000000000000000000000000000000", O => "00000000000000000000000000000000",
        P => "00000000000000000000000000000000", S => ALU_Op, Y => Y);
END Behavioral;