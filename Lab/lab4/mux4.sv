`timescale 1ns / 1ps
module mux4(input logic d0, d1, d2, d3, s1, s0, output logic y);
    assign y = s1 ? (s0 ? d3 : d2) : (s0 ? d1 : d0);
endmodule