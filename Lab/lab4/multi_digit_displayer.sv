`timescale 1ns / 1ps
module multi_digit_displayer(
    input logic clk,
    input logic [15:0] sw,
    output logic [0:6] seg,  
    output logic [3:0] an
);
    reg [1:0] active_digit = 0;
    integer refresh_counter = 0;
    wire [0:6] seg0, seg1, seg2, seg3;
    
    bcd_to_7_segment converter0(clk, sw[3:0], seg0);
    bcd_to_7_segment converter1(clk, sw[7:4], seg1);
    bcd_to_7_segment converter2(clk, sw[11:8], seg2);
    bcd_to_7_segment converter3(clk, sw[15:12], seg3);

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter == 250000) begin
            refresh_counter <= 0;
            active_digit <= active_digit + 1;
            if (active_digit == 3) active_digit <= 0;
        end
    end

    always @(*) begin
        case (active_digit)
            2'b00: begin
                seg = seg0;
                an = 4'b1110;
            end
            2'b01: begin
                seg = seg1;
                an = 4'b1101;
            end
            2'b10: begin
                seg = seg2;
                an = 4'b1011;
            end
            2'b11: begin
                seg = seg3;
                an = 4'b0111;
            end
        endcase
    end
endmodule