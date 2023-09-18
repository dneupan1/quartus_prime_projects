module BlinkingLED(
    input clk,          // 50 MHz clock input
    output [6:0] HEX0,  // First 7-segment display
    output [6:0] HEX1   // Second 7-segment display
);

    // This fixed value is for debugging purposes.
    // It should display '2' on HEX0 and '1' on HEX1.
    reg [7:0] display_counter = 8'h12;  

	 function [6:0] decode;
		 input [3:0] nibble;
		 begin
			  case (nibble)
					4'h0: decode = 7'b1000000; // Display 0
					4'h1: decode = 7'b1111001; // Display 1
					4'h2: decode = 7'b0100100; // Display 2
					4'h3: decode = 7'b0110000; // Display 3
					4'h4: decode = 7'b0011001; // Display 4
					4'h5: decode = 7'b0010010; // Display 5
					4'h6: decode = 7'b0000010; // Display 6
					4'h7: decode = 7'b1111000; // Display 7
					4'h8: decode = 7'b0000000; // Display 8
					4'h9: decode = 7'b0010000; // Display 9
					4'hA: decode = 7'b0001000; // Display A
					4'hB: decode = 7'b0000011; // Display B
					4'hC: decode = 7'b1000110; // Display C
					4'hD: decode = 7'b0100001; // Display D
					4'hE: decode = 7'b0000110; // Display E
					4'hF: decode = 7'b0001110; // Display F
					default: decode = 7'b1111111; // Display nothing (or a dash for error)
			  endcase
		 end
	endfunction



    assign HEX0 = decode(display_counter[3:0]);  // Lower 4 bits
    assign HEX1 = decode(display_counter[7:4]);  // Upper 4 bits

endmodule
