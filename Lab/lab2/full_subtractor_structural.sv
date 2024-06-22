`timescale 1ns / 1ps
module full_subtractor_structural(
    input logic A, B, Bin,
    output logic D, Bout
);
    wire w1, w2, w3, na, nw1;
    xor x1(w1, A, B);
    xor x2(D, w1, Bin);
    not n1(na, A);
    not n2(nw1, w1);
    and a1(w2, nw1, Bin);
    and a2(w3, na, B);
    or o1(Bout, w2, w3);
endmodule