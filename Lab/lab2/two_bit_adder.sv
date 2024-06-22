`timescale 1ns / 1ps
module two_bit_adder(A0, A1, B0, B1, S0, S1, Cout);
    input logic A0, A1, B0, B1;
    output logic Cout, S1, S0;
    reg Cout, S1, S0; 
    wire w1;
    full_adder_structural fas1(A0, B0, 0, S0, w1);
    full_adder_structural fas2(A1, B1, w1, S1, Cout);
endmodule