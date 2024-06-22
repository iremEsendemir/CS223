`timescale 1ns / 1ps
module four_to_one_mux (
    input wire S1, S0,
    input wire D3, D2, D1, D0,
    output reg Y
);
    wire y0, y1;
    two_to_one_mux mux1(S0, D0, D1, y0);
    two_to_one_mux mux2(S0, D2, D3, y1);
    two_to_one_mux mux3(S1, y0, y1, Y);
endmodule