`timescale 1ns / 1ps
module multiplier(
    input logic A0, A1, 
    output logic S0, S1, S2, S3
    );
    wire c1, c2;
    assign S0 = A0;
    full_adder_structural fas1(A1, A0, 0, S1, c1);
    full_adder_structural fas2(0, A1, c1, S2, c2);
    assign S3 = c2;    
endmodule