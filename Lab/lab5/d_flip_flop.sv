`timescale 1ns / 1ns
module d_flip_flop(
    input logic clk,
    input logic I,
    output reg O
);
    integer a = 0;
    always_ff@(posedge clk) begin
        a = a + 1;
        if( t == 300000000)begin
            I <= O;
            I = 0;
        end
    end
endmodule