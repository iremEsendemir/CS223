`timescale 1ns / 1ps
module eight_to_one_mux(
    input logic s2, s1, s0,
    input logic i7, i6, i5, i4, i3, i2, i1, i0,
    output logic y
);
    logic o1, o2;
    four_to_one_mux mux1(s1, s0, i7, i6, i5, i4, o1);
    four_to_one_mux mux2(s1, s0, i3, i2, i1, i0, o2);
    assign y = (o2 & ~s2) | (o1 & s2);
endmodule