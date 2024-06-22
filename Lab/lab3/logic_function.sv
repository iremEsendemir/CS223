`timescale 1ns / 1ps
module logic_function(
     input logic A, B, C, D, E,
     output logic Y
);
    wire k, l, m, n;
    two_to_four_decoder decoder (E, A, 1, k, l, m, n);
    eight_to_one_mux mux (D, B, C,m, ~E, l, ~l, n, 0, n, ~k, Y);
endmodule