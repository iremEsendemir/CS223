`timescale 1ns / 1ps
module TXBUF(
    input logic clk,
    input logic [7:0] sw,
    input logic btnC,
    input logic btnD,
    output logic done,
    output logic tx,
    output logic [7:0] led,
    output logic [3:0][7:0] Tdatas
);
    typedef enum logic {idle, transmit} typename;
    typename state;
    logic [3:0] bitcntr;
    logic [10:0]data_hold = 0;
    logic parity;
    logic btnD_prev;
    logic btnC_prev;

    initial begin
        Tdatas <= 0;
        btnD_prev <= 0;
        btnC_prev <= 0;
    end

    clockDiv div(clk,clock_out);

    always_ff @(posedge clock_out) begin
        btnD_prev <= btnD;
        btnC_prev <= btnC;

        case (state)

        idle: begin
            bitcntr <=0;
            done <= 1'b0;
            tx <= 1'b1;
            if(btnD && ~btnD_prev) begin
                Tdatas [3:1] <= Tdatas [2:0];
                Tdatas[0] <= sw;
                state <= idle;
            end
            if(btnC && ~btnC_prev) begin
                parity <= ^Tdatas[3];
                data_hold <= {1'b1, ~parity, Tdatas[3], 1'b0};
                state <= transmit;
                bitcntr <=0;
            end
        end

        transmit: begin
            tx <= data_hold[bitcntr];
            bitcntr<=bitcntr+1;
            if(bitcntr==10) begin
            done <= 1'b1;
            state <= idle;
            end
        end

        endcase
    end
    assign led = Tdatas[0];
endmodule
