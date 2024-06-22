`timescale 1ns / 1ps
module UART(
    input logic clk,
    input logic [7:0] sw,
    input logic btnC,
    input logic btnD,
    input logic btnU,
    input logic btnR,
    input logic btnL,
    input logic received,
    output logic transmitted,
    output logic [7:0] led2,
    output logic [7:0] led,
    output logic [0:6] seg,
    output logic [3:0] an
);
    logic Rdone, Tdone;
    logic [3:0][7:0]Rdatas;
    logic [3:0][7:0]Tdatas;
    TXBUF transmitter(clk, sw, btnC, btnD, Tdone, transmitted, led, Tdatas);
    RXBUF receiver(clk, received, Rdone, led2, Rdatas);
    segment_display(clk, btnU, btnR, btnL, Tdatas, Rdatas, an, seg);
endmodule