`timescale 1ns / 1ps
module TrafficLights( input clk, input SA, input SB,
output reg la2, la1, la0, lb2, lb1, lb0);
 wire n2,n1,n0,c2,c1,c0;
    assign la2 = 1;
    assign la1 = c2 | (~c2 & ~c0);
    assign la0 = c2 | (~c2 & ~c1 & ~c0);
    assign lb2 = 1;
    assign lb1 = ~c2 | (c2 & ~c1 & c0);
    assign lb0 = ~c2;
    assign n2 = (~c2 & ~c1 & ~c0 & ~SA) | (c2 & ~c1);
    assign n1 = (~c2 & ~c1 & c0) | (~c2 & c1 & ~c0) | (c2 & ~c1 & c0 & ~SB);
    assign n0 = (~c2 & ~c1 & ~c0 & SA) | (~c2 & c1 & ~c0 & ~SA) | (c2 & ~c1 & ~c0) | (c2 & ~c1 & c0 & SB);
    dFlipFlop d2(clk, n2, c2);
    dFlipFlop d1(clk, n1, c1);
    dFlipFlop d0(clk, n0, c0);
endmodule