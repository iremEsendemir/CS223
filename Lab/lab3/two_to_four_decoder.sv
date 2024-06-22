`timescale 1ns / 1ps
module two_to_four_decoder(
 input logic i0, i1, e,
 output logic o0, o1, o2, o3
);
    assign o0 = ~i0 & ~i1 & e;
    assign o1 = i0 & ~i1 & e;
    assign o2 = ~i0 & i1 & e;
    assign o3 = i0 & i1 & e;
endmodule 