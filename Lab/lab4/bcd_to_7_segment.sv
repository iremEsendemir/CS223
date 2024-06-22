`timescale 1ns / 1ps
module bcd_to_7_segment(
 input logic clk,
 input logic [3:0] bcd,
 output logic [0:6] seg // segments a-g
);
    always @(posedge clk ) begin
        case(bcd)
        4'b0000: seg = 7'b0000001; // 0
        4'b0001: seg = 7'b1001111; // 1
        4'b0010: seg = 7'b0010010; // 2
        4'b0011: seg = 7'b0000110; // 3
        4'b0100: seg = 7'b1001100; // 4
        4'b0101: seg = 7'b0100100; // 5
        4'b0110: seg = 7'b0100000; // 6
        4'b0111: seg = 7'b0001111; // 7
        4'b1000: seg = 7'b0000000; // 8
        4'b1001: seg = 7'b0000100; // 9
        default: seg = 7'b1111110; // -
        endcase
    end
endmodule 
