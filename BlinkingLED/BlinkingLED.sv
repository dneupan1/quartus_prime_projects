module BlinkingLED(
    input clk,            // 50 MHz clock input
    output reg led        // LED output
);

    reg [25:0] counter = 0; // 26 bit counter for 50 MHz clock

    always @(posedge clk) begin
        counter <= counter + 1;
        if(counter == 25000000) begin  // Half second delay at 50MHz
            led <= ~led;                // Toggle the LED
            counter <= 0;               // Reset the counter
        end
    end

endmodule