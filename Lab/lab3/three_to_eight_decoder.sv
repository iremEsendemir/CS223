`timescale 1ns / 1ps
module three_to_eight_decoder(
    input logic i0, i1, i2, e,
    output logic o0, o1, o2, o3, o4, o5, o6, o7
);
    logic e_and_i2, e_and_not_i2;
    assign e_and_i2 = e & i2;
    assign e_and_not_i2 = e & ~i2;
    two_to_four_decoder decoder1(i0, i1, e_and_i2, o4, o5, o6, o7);
    two_to_four_decoder decoder2(i0, i1, e_and_not_i2, o0, o1, o2, o3);
endmodule
