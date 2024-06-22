`timescale 1ns / 1ps
module RXBUF(
    input logic clk,
    input logic rxbit,
    output logic done,
    output logic [7:0] led2,
    output logic [3:0][7:0] Rdatas
);
    typedef enum logic [1:0]{idle, receive, shift} tstate;
    tstate state;
    logic [3:0] bitcntr;
    logic clock_out;
    logic parity = 0;
    logic [8:0] takenValue;
    initial begin
        Rdatas <= 0;
    end
    clockDiv div(clk,clock_out);
    always_ff @(posedge clock_out) begin
        case (state)
        idle: begin
            done <= 1'b0;
            bitcntr <=0;
            if(!rxbit) begin
                state<=receive;
            end
        end
        receive: begin
            takenValue[bitcntr] <= rxbit;
            bitcntr<=bitcntr+1;
            if(bitcntr==8) begin
                done <= 1'b1;
                state <= shift;
            end
        end
        shift: begin
            Rdatas[3:1] <= Rdatas[2:0];
            parity <= ^takenValue;
            if(parity) Rdatas[0] <= takenValue[7:0];
            else Rdatas[0] <= 0;
            state <= idle;
        end
        endcase
    end
    assign led2 = Rdatas[3];
endmodule