LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY variable_CLK IS
  PORT(
    CLK, RESET, UP_IN, DOWN_IN    : IN STD_LOGIC;
    CLK_TICK                      : OUT STD_LOGIC
  );
END variable_CLK;


ARCHITECTURE beha OF variable_CLK IS

SIGNAL clock_freq1 : integer := 4;
SIGNAL clock_counter : integer := 1;
SIGNAL base_freq1 : integer := 4;

BEGIN
  
 
  
  set_frequency : PROCESS(CLK, UP_IN, DOWN_IN)
  BEGIN
    IF(rising_edge(CLK)) THEN
      IF (RESET = '1') THEN
        IF(UP_IN = '1') THEN
          clock_freq1 <= (clock_freq1 / 2);
        ELSIF (DOWN_IN = '1') THEN
          clock_freq1 <= (clock_freq1 * 2);
        END IF;
      ELSE                -- IF REST is a '1'.
        clock_freq1 <= base_freq1;
      END IF;
  END IF;
    
  END PROCESS;
  
  update_tick : PROCESS(CLK,DOWN_IN, UP_IN)
  BEGIN
    IF(rising_edge(CLK)) THEN
        IF(RESET = '1') THEN
            IF (DOWN_IN = '0' AND UP_IN ='0') THEN
              IF (clock_counter = clock_freq1)THEN
                IF(clock_counter > 1) THEN
                  CLK_TICK <= '1';
                  clock_counter <= 0;
                ELSE
                  CLK_TICK <= '1';
                  clock_counter <= 0;
                END IF;
              ELSIF (clock_counter < clock_freq1) THEN
                clock_counter <= clock_counter + 1;
                CLK_TICK <= '0';
              END IF;
            ELSIF(UP_IN = '1' OR DOWN_IN = '1') THEN
                clock_counter <=0;
                CLK_TICK <= '0';
            END IF;
          ELSE            -- IF RESET is enabled.
            clock_counter <= 1;
            CLK_TICK <= '0';
--            clock_freq1 <= base_freq1;
        END IF;
    END IF;    
  END PROCESS;
  

 
END beha;