LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Package Declaration Section
PACKAGE ALU_pkg IS

    -- 2:1 Mux (Bussless) 
    COMPONENT Mux2_1 IS
        PORT (

            A, B : IN STD_LOGIC;
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC
        );
    END COMPONENT;

    -- 2:1 Mux (Bus)
    COMPONENT TwoToOne_Mux IS
        PORT (
            A, B : IN STD_LOGIC_VECTOR (0 TO 31);
            S : IN STD_LOGIC;
            Y : OUT STD_LOGIC_VECTOR (0 TO 31)
        );
    END COMPONENT;

    -- 4:1 Mux
    COMPONENT FourToOne_MUX IS
        PORT (
            A, B, C, D : IN STD_LOGIC_VECTOR (0 TO 31);
            S : IN STD_LOGIC_VECTOR (0 TO 1);
            Y : OUT STD_LOGIC_VECTOR (0 TO 31)
        );
    END COMPONENT;

    -- 16:1 Mux
    COMPONENT SixteenToOne_MUX IS
        PORT (
            A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P : IN STD_LOGIC_VECTOR (0 to 31);
            S : IN STD_LOGIC_VECTOR(0 to 3);
            Y : OUT STD_LOGIC_VECTOR (0 to 31)
        );
    END COMPONENT;

    --Full Adder
    COMPONENT Full_Adder IS
        PORT (
            a, b, cin : IN STD_LOGIC;
            s, cout : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Carry Select Adder - 32Bit
    COMPONENT Carry_Select_Adder_32Bit IS
        PORT (
            X : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            Y : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            CARRY_IN : IN STD_LOGIC;
            SUM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            CARRY_OUT : OUT STD_LOGIC;
            OVERFLOW : OUT STD_LOGIC);
    END COMPONENT;

    --Logical Right shift
    COMPONENT LRS IS
        PORT (
            A : IN STD_LOGIC_VECTOR(0 TO 31);
            Y : OUT STD_LOGIC_VECTOR(0 TO 31)
        );
    END COMPONENT;

    --Logical Left Shift
    COMPONENT LLS IS
        PORT (
            A : IN STD_LOGIC_VECTOR(0 TO 31);
            Y : OUT STD_LOGIC_VECTOR(0 TO 31)
        );
    END COMPONENT;

    --Arithematic Right Shift
    COMPONENT ARS IS
        PORT (
            A : IN STD_LOGIC_VECTOR(0 TO 31);
            Y : OUT STD_LOGIC_VECTOR(0 TO 31)
        );
    END COMPONENT;

    --Arithematic Left Shift
    COMPONENT ALS IS
        PORT (
            A : IN STD_LOGIC_VECTOR(0 TO 31);
            Y : OUT STD_LOGIC_VECTOR(0 TO 31)
        );
    END COMPONENT;

END PACKAGE;