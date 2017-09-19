LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ALU_TB is
	generic
	(
		n	: integer  :=	4  -- Quantidade de bits do vetor
	);
end ALU_TB;



architecture testbench of ALU_TB is
		-- Input ports
	signal   CONTROL : std_logic_vector (3 downto 0);
	signal	SRC1	: std_logic_vector (n-1 downto 0);
	signal	SRC2	: std_logic_vector (n-1 downto 0);

		-- Output ports
	signal	RESULT	:  std_logic_vector (n-1 downto 0);
	signal	ZERO	: std_logic;

begin

	duv: entity work.ALU
	
	generic map (
	n => n
	)
	
	port map (
	CONTROL, 
	SRC1,
	SRC2, 
	RESULT,
	ZERO 
	);
	
	process
	begin 
	CONTROL <= "0000";  -- and: 1001
	SRC1 <= "1011";
	SRC2 <= "1101";   
	wait for 10 ns;
	CONTROL <= "0001"; -- or: 1110
	SRC1 <= "1100";
	SRC2 <= "1010";
	wait for 10 ns; 
	CONTROL <= "0010";  -- soma: 1000
	SRC1 <= "0011";
	SRC2 <= "0101";
	wait for 10 ns;
	CONTROL <= "0110"; --subtraçao: 0010
	SRC1 <= "1011";
	SRC2 <= "1001";
	wait for 10 ns;
	CONTROL <= "0111"; -- SRC1 < SRC2 
	SRC1 <= "0011";  -- Aqui é menor: 0001
	SRC2 <= "0100";
	wait for 10 ns;
	SRC1 <= "1101";  -- Aqui é maior: 0000
	SRC2 <= "0111";
	wait for 10 ns; 
	SRC1 <= "0111";  -- Aqui é igual: 0000
	SRC2 <= "0111";
	wait for 10 ns; 
	CONTROL <= "1100";  -- nor: 0010
	SRC1 <= "0101";
	SRC2 <= "1100";  
	wait for 10 ns; 
	CONTROL <= "1111";  -- nada: 0000
	SRC1 <= "0011";
	SRC2 <= "0101";
	wait;
	end process;
	
end testbench;

