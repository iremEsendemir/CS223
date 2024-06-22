`timescale 1ns / 1ps
module full_adder_structural(
    input logic A, B, Cin,
    output logic Sum, Cout
);
    wire w1, w2, w3;
    xor x1(w1, A, B);
    xor x2(Sum, w1, Cin);
    and a1(w2, w1, Cin);
    and a2(w3, A, B);
    or o1(Cout, w2, w3);
endmodule