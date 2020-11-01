LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fsm IS
  PORT(
  CLOCK, RESET  : IN STD_LOGIC;
   pass_thru    : IN STD_LOGIC_VECTOR(6 downto 0); 
   Q            : OUT STD_LOGIC_VECTOR(6 downto 0)
  );
END fsm;


ARCHITECTURE Behavior OF fsm IS

-- Declared signals
TYPE State_Type IS (H,E,L,L1,O,N);
SIGNAL present_state, next_state   :  State_Type;  -- is present state,  next state
SIGNAL counter : integer := 0;
SIGNAL reset_flag : integer := 0;

BEGIN
  
  state_proc : PROCESS(present_state) -- state table
    BEGIN  
      CASE present_state IS
        WHEN H  =>  next_state  <= E;         
        WHEN E  =>  next_state  <= L;   
        WHEN L  =>  next_state  <= L1;  
        WHEN L1 =>  next_state  <= O;   
        WHEN O  =>  next_state  <= N;   
        WHEN N  =>  next_state  <= H;   
      END CASE;     
  END PROCESS;
  
  clock_proc : PROCESS(CLOCK, RESET)
    BEGIN
      IF(rising_edge(CLOCK)) THEN
        
        IF (RESET = '1') THEN
          -- counter <= counter + 1;  -- Change back to 8
          IF (counter < 8 AND reset_flag = 0) THEN         -- If counter is less than 8 output the characters
            present_state <= next_state;
            counter <= counter + 1;
        
           CASE present_state IS
              WHEN H  => Q <= "0110111";
              WHEN E  => Q <= "1001111";
              WHEN L  => Q <= "0001110";
              WHEN L1 => Q <= "0001110";
              WHEN O  => Q <= "1111110";
              WHEN N =>  Q <= "0000000";
           END CASE;
          ELSIF(reset_flag = 0) THEN          -- if counter is greater than 8 output the pass_thru
            Q <= pass_thru;
            counter <= 0;                     -- reset the counter to avoid going out range for the integer data type.
            reset_flag <= 1;
          ELSIF(reset_flag = 1) THEN          -- if flag is set then just pass thru 
            Q <= pass_thru;                   -- the input to Q.
          END IF;
        ELSIF (RESET = '0') THEN              -- if the circuit is reset return to the original state.
          present_state <= H;                 -- reset the state
          counter <= 0;                       -- reset the counter.
          reset_flag <= 0;                    -- reset the reset flag.
          Q <= "0000000";
      END IF;
    END IF;
  END PROCESS;
  
  --output_state : PROCESS(present_state) 

 
  
  
END Behavior;
