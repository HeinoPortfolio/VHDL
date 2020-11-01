--

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity ONE_BIT_ADDER is
	port(
		a, b, cin 	:in STD_LOGIC;
		sum, cout	:out STD_LOGIC
	);
end ONE_BIT_ADDER;

architecture behavior of ONE_BIT_ADDER is
	begin

		sum <=(not a and anot b and cin) or
			(not a and b and not cin) or
			(a and not b and not cin) or
			(a and b and cin);
		
		cout <=(not a and b and cin)or
			(a and not b and cin) or
			(a and b and not cin) or
			(a and b and cin);
end behavior;

LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FOUR_BIT_ADDER is 
	port(
		a,b	:in 	STD_LOGIC_VECTOR(3 downto 0);
		ans	:out	STD_LOGIC_VECTOR(3 downto 0);
		cout	:out	STD_LOGIC		
	);

architecture block_diagram of FOUR_BIT_ADDER is

component ONE_BIT_ADDER
	port(
		a,b,cin 	:IN STD_LOGIC;
		sum,cout	:out STD_LOGIC
	);
end component;

signal c0,c1,c2,c3 : STD_LOGIC;

begin
c0 <= '0';
b_adder0: ONE_BIT_ADDER port map (a(0), b(0),c0, ans(0), c1);
b_adder1: ONE_BIT_ADDER port map (a(1), b(1), c1,ans(1), c2);
b_adder2: ONE_BIT_ADDER port map (a(2), b(2), c2, ans(2), c3);
b_adder3: ONE_BIT_ADDER port map (a(3), b(3), c3, ans(3), cout);

end block_diagram;
