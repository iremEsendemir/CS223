`timescale 1ns / 1ps
module clockDiv(
    input logic clock_in,
    output logic clock_out
);
    parameter baud_rate = 9600;
    logic[27:0] counter;
    always @(posedge clock_in) begin
        counter <= counter + 1;
        if(counter>=(100_000_000)/baud_rate)begin
            counter <= 0;
            clock_out <= ~clock_out;
        end
    end
endmodule