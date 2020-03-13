library IEEE;
use IEEE.STD_LOGIC_1164.all;

use IEEE.NUMERIC_STD.all;

library work;
use work.tb_types.all;

entity tb_WasmFpgaMemory is
    generic (
        stimulus_path : string := "../../../../../simstm/";
        stimulus_file : string := "WasmFpgaMemory.stm"
    );
end;

architecture behavioural of tb_WasmFpgaMemory is

    constant CLK100M_PERIOD : time := 10 ns;

    signal Clk100M : std_logic := '0';
    signal Rst : std_logic := '1';
    signal nRst : std_logic := '0';

    signal WasmFpgaMemory_FileIO : T_WasmFpgaMemory_FileIO;
    signal FileIO_WasmFpgaMemory : T_FileIO_WasmFpgaMemory;

    component tb_FileIO is
      generic (
        stimulus_path: in string;
        stimulus_file: in string
      );
      port (
        Clk : in std_logic;
        Rst : in std_logic;
        WasmFpgaMemory_FileIO : in T_WasmFpgaMemory_FileIO;
        FileIO_WasmFpgaMemory : out T_FileIO_WasmFpgaMemory
      );
    end component;

    component WasmFpgaMemory
      port (
        Clk : in std_logic;
        nRst : in std_logic;
        Adr : in std_logic_vector(23 downto 0);
        Sel : in std_logic_vector(3 downto 0);
        DatIn : in std_logic_vector(31 downto 0); 
        We : in std_logic;
        Stb : in std_logic; 
        Cyc : in std_logic_vector(0 downto 0);
        DatOut : out std_logic_vector(31 downto 0);
        Ack : out std_logic
      );
    end component;

begin

	nRst <= not Rst;

    Clk100MGen : process is
    begin
        Clk100M <= not Clk100M;
        wait for CLK100M_PERIOD / 2;
    end process;

    RstGen : process is
    begin
        Rst <= '1';
        wait for 100ns;
        Rst <= '0';
        wait;
    end process;

    tb_FileIO_i : tb_FileIO
        generic map (
            stimulus_path => stimulus_path,
            stimulus_file => stimulus_file
        )
        port map (
            Clk => Clk100M,
            Rst => Rst,
            WasmFpgaMemory_FileIO => WasmFpgaMemory_FileIO,
            FileIO_WasmFpgaMemory => FileIO_WasmFpgaMemory
        );

    WasmFpgaMemory_i : WasmFpgaMemory
      port map (
        Clk => Clk100M,
        nRst => nRst,
        Adr => FileIO_WasmFpgaMemory.Adr,
        Sel => FileIO_WasmFpgaMemory.Sel,
        DatIn => FileIO_WasmFpgaMemory.DatIn,
        We => FileIO_WasmFpgaMemory.We,
        Stb => FileIO_WasmFpgaMemory.Stb,
        Cyc => FileIO_WasmFpgaMemory.Cyc,
        DatOut => WasmFpgaMemory_FileIO.DatOut,
        Ack => WasmFpgaMemory_FileIO.Ack
      );

end;
