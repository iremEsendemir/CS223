`timescale 1ns / 1ps
module d_flip_flop(input clk, input reset, input i, output reg o);
    always @(posedge clk)begin
        if (reset)begin
        o <= 1'b0;
        end
        else begin
        o <= i;
        end
    end
endmodule