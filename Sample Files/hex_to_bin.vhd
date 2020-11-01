LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;


-- Hexadecimal to 7 segment decoder for led.

ENTITY hex_to_bin IS
	PORT(
			hex_in 		:  IN STD_LOGIC_VECTOR(3 downto 0);
			out_0, out_1, out_2, out_3 : OUT STD_LOGIC
	); 
	
END hex_to_bin;

ARCHITECTURE a OF hex_to_bin IS
	
	BEGIN
		
		
		
		out_3 <= hex_in(3);
		out_2 <= hex_in(2);
		out_1 <= hex_in(1);
		out_0 <= hex_in(0);
		
		--
		--
	
		
END a;