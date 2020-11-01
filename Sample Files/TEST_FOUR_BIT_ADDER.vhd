LIBARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TEST_FOUR_BIT_ADDER is
end TEST_FOUR_BIT_ADDER;

architecture TEST of TEST_FOUR_BIT_ADDER is

	component FOUR_BIT_ADDER
		port(
			a,b		:in 	STD_LOGIC_VECTOR(3 downto 0);
			ans		:out	STD_LOGIC_VECTOR(3 downto 0);
			cout		:out	STD_LOGIC_VECTOR
		);
	end component;

for testing: FOUR_BIT_ADDER use entity WORK>FOUR_BITADDER(block_diagram);
signal a, b		:STD_LOGIC_VECTOR(3 downto 0);
signal ans		:STD_LOGIC_VECTOR(3 downto 0);
signal cout		:STD_LOGIC;

begin
testing: FOUR_BIT_ADDER port map(a,b, ans,cout);

test_stimulus: process
	begin

	wait for 5 ns;

				a <= "0010";
				wait for 10 ns;
				b <= "0011";
				wait for 10 ns;
				a <= "0011";

	wait for 10 ns;
	b <= "0111";
				wait for 10 ns;
				wait for 40 ns;
				a <= "1111";
				b <= "1011";
				wait for 10 ns;
				wait for 40 ns;
end process test_stimulus;

END TEST;
