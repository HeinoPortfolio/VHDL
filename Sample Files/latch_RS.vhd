LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY latch_RS IS
  PORT(
    CLK, R, S : IN  STD_LOGIC;
    Q         : OUT STD_LOGIC
  );
END latch_RS;

ARCHITECTURE Structural OF latch_RS IS
  SIGNAL  R_g, S_g, Qa, Qb  : STD_LOGIC;
  ATTRIBUTE  keep : boolean;
  ATTRIBUTE  keep OF R_g, S_g, Qa, Qb : SIGNAL IS true;
  BEGIN
    R_g <= R AND CLK;
    S_g <= S AND CLK;
    Qa  <= NOT(R_g OR Qb);
    Qb  <= NOT (S_g OR Qa);
    
    Q <= Qa;
  END Structural;