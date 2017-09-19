LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	generic
	(
		n	: integer  :=	6 -- Number of bits of the vector
	);


	port
	(
		-- Input ports
		CONTROL : in std_logic_vector (3 downto 0);
		SRC1, SRC2 : in std_logic_vector (n-1 downto 0);


		-- Output ports
		RESULT : out std_logic_vector (n-1 downto 0);
		ZERO : out std_logic
	);
	
end ALU;

architecture BEHAVIOR of ALU is

signal aux_comp : std_logic_vector (n-1 downto 0);
signal RESULT_aux : std_logic_vector (n-1 downto 0) := (others => '0');


constant teste_zero : std_logic_vector (n-1 downto 0) := (others => '0');

begin
					 
	aux_comp <= (0 => '1', others => '0') when SRC1 < SRC2 else (others => '0');
	
	with CONTROL select
		RESULT_aux <= SRC1 and SRC2 when "0000",
			      SRC1 or SRC2 when "0001",
			      std_logic_vector (signed(SRC1) + signed(SRC2)) when "0010",
			      std_logic_vector (signed(SRC1) - signed(SRC2)) when "0110",
			      aux_comp when "0111",
			      SRC1 nor SRC2 when "1100",
			      (others => '0') when others;

	ZERO <= '1' when RESULT_aux = teste_zero else
			  '0';
			  
	RESULT <= RESULT_aux;


end BEHAVIOR;



