LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY flipflop_D IS
	PORT(
		CLK, D 		: IN STD_LOGIC;
		Q			: OUT STD_LOGIC
	);
END flipflop_D;

ARCHITECTURE stru OF flipflop_D IS
	COMPONENT latch_D
		PORT(
		CLK, D    : IN  STD_LOGIC;
    	Q         : OUT STD_LOGIC
		);
	END COMPONENT;
	
	-- SIGNAL DECLARATIONS
	SIGNAL QM 	: STD_LOGIC;
	
	BEGIN
	DLAT1:	latch_d PORT MAP (NOT CLK, D, Qm);
	DLAT2:	latch_d PORT MAP (CLK, Qm, Q);
	
	
	-- QM maps to theD input of the second latch.
	
END stru;