-- LabFourPartI
--
-- Students:
-- 	Deepak Neupane
--		Hansen Shamoon
--
-- In this part, we need to implement a 8 bit counter using 8 instances of 
-- T-Type flip flop

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity tff_temp is
    port(
        Q: out STD_LOGIC;
        T: IN STD_LOGIC;
        Clock: IN STD_LOGIC;
        Clear: IN STD_LOGIC
    );
end tff_temp;

architecture arc_T_ff of tff_temp is
    signal Q_temp: std_logic;
begin
    process(Clock)
    begin
        if Clear = '1' then
            Q_temp <= '0';
        elsif Clock'event and Clock = '1' then
            if T = '1' then
                Q_temp <= not Q_temp;
            else
                Q_temp <= Q_temp;
            end if;
        end if;
    end process;
    Q <= Q_temp; 
end arc_T_ff;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Lab4Part1 is
    port (
        Clock: in std_logic;
        Clear: in std_logic;
        en: in std_logic;
		  HEX0,HEX1: out STD_LOGIC_VECTOR(0 to 6)
    );
end entity;


architecture foo of Lab4Part1 is

    component tff_temp is	 
    port(
        Q: out STD_LOGIC;
        T: IN STD_LOGIC;
        Clock: IN STD_LOGIC;
        Clear: IN STD_LOGIC
    );
    end component;


	FUNCTION to_7segment (bin : STD_LOGIC_VECTOR(0 to 3))	RETURN STD_LOGIC_VECTOR IS
		VARIABLE segment_pattern : STD_LOGIC_VECTOR(6 DOWNTO 0);
		BEGIN
			 -- Default to blank display
			 segment_pattern := "1111111";

			 CASE bin IS
				WHEN "0000" => segment_pattern := "0000001"; -- 0
				WHEN "0001"  => segment_pattern := "1001111"; -- 1
				WHEN "0010"  => segment_pattern := "0010010"; -- 2
				WHEN "0011"  => segment_pattern := "0000110"; -- 3
				WHEN "0100"  => segment_pattern := "1001100"; -- 4
				WHEN "0101"  => segment_pattern := "0100100"; -- 5
				WHEN "0110"  => segment_pattern := "0100000"; -- 6
				WHEN "0111"  => segment_pattern := "0001111"; -- 7
				WHEN "1000"  => segment_pattern := "0000000"; -- 8
				WHEN "1001"  => segment_pattern := "0000100"; -- 9
				WHEN "1010"  => segment_pattern := "0001000"; -- 10
				WHEN "1011"  => segment_pattern := "1100000"; -- 11
				WHEN "1100"  => segment_pattern := "0110001"; -- 12
				WHEN "1101"  => segment_pattern := "1000010"; -- 13
				WHEN "1110"  => segment_pattern := "0110000"; -- 14
				WHEN "1111"  => segment_pattern := "0111000"; -- 15
				WHEN OTHERS => segment_pattern := "1111111"; -- Blank display for other values
			END CASE;
		RETURN segment_pattern;
	END FUNCTION to_7segment;
	
	signal cnt: std_logic_vector(0 to 7);
	signal T: std_logic_vector(0 to 7);

begin
	process (Clock, Clear)
	BEGIN
    T <= (en, en and cnt(0), T(1) and cnt(1), T(2) and cnt(2),
          T(3) and cnt(3), T(4) and cnt(4), T(5) and cnt(5), T(6) and cnt(6));	 
	 
	end process;
	
	TFF_0: tff_temp port map (Q => cnt(0), T => T(0), Clock => Clock, Clear => Clear);
	TFF_1: tff_temp port map (Q => cnt(1), T => T(1), Clock => Clock, Clear => Clear);
	TFF_2: tff_temp port map (Q => cnt(2), T => T(2), Clock => Clock, Clear => Clear);
	TFF_3: tff_temp port map (Q => cnt(3), T => T(3), Clock => Clock, Clear => Clear);
	TFF_4: tff_temp port map (Q => cnt(4), T => T(4), Clock => Clock, Clear => Clear);
	TFF_5: tff_temp port map (Q => cnt(5), T => T(5), Clock => Clock, Clear => Clear);	 
	TFF_6: tff_temp port map (Q => cnt(6), T => T(6), Clock => Clock, Clear => Clear);	 
	TFF_7: tff_temp port map (Q => cnt(7), T => T(7), Clock => Clock, Clear => Clear);
	
	HEX0 <= to_7segment(T(0 to 3));
	HEX1 <= to_7segment(T(4 to 7));

end architecture;