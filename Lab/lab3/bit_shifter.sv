`timescale 1ns / 1ps
module bit_shifter(
    input logic S, i3, i2, i1, i0,
    output logic o3, o2, o1, o0, k
);
    two_to_one_mux m1(S,i3, 0, o3);
    two_to_one_mux m2(S, i2, i3, o2);
    two_to_one_mux m3(S, i1, i2, o1);
    two_to_one_mux m4(S, i0, i1, o0);
    two_to_one_mux m5(S, 0, i0, k );
endmodule