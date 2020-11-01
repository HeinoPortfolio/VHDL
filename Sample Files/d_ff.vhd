LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY D_FF IS
  PORT(
    CLK, D  : IN STD_LOGIC;
    Q       : INOUT STD_LOGIC
  );
END D_ff;

ARCHITECTURE behv of D_FF IS
  BEGIN
    PROCESS(D, CLK)
      BEGIN 
        IF CLK' EVENT AND CLK ='1' THEN
          CASE D IS
            WHEN '0' => Q <= '0';
            WHEN '1' => Q <= '1';
            WHEN OTHERS =>
              Q <= Q;
          END CASE;
        ELSIF CLK ='1' OR CLK = '0' THEN
          Q <= Q;
        END IF;
  END PROCESS;
END behv;
