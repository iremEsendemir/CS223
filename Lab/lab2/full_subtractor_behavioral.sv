`timescale 1ns / 1ps
module full_subtractor_behavioral(
    input logic A, B, Bin,
    output logic D, Bout
);
    always @(A,B,Bin) begin
        D <= A^B^Bin;
        Bout <= (~A&B) | (~(A^B)&Bin);
    end
endmodule

