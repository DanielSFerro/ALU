# ALU
Project in VHDL of Arithmetic Logic Unit

ALU is an integrated circuit that hold Arithmetic and Logic operations. 

We have three files:
- The code itself (ALU.vhd)
- A testbench of the principal code (ALU_TB.vhd)
- A file "do" that have the instructions of what must do for simulation (tb_ALU.do)

Used the programs Quartus 13.0 sp1 and ModelSim_Altera 10.1d.

## The Code
###### The Pins

            -- Input ports
		CONTROL : in std_logic_vector (3 downto 0); -- Indicated which operation the ALU is going to do
		SRC1, SRC2 : in std_logic_vector (n-1 downto 0); --The two input source


		-- Output ports
		RESULT : out std_logic_vector (n-1 downto 0);
		ZERO : out std_logic; -- When RESULT is everything zero, then this output must be '1'


###### Arithmetic and Logic

For this project, the ALU is going to do few os operations listed below:
1. Arithmetic:
   - Add (CONTROL = "0010")
   - Subtract (CONTROL = "0110")
2. Logic:
   - AND (CONTROL = "0000")
   - OR (CONTROL = "0001")
   - NOR (CONTROL = "1100")
3. Others:
   - Compare which is the lowest (CONTROL = "0111")
