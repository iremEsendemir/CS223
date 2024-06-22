`timescale 1ns / 1ps
module two_to_one_mux (S, D0, D1, Y);
    input S, D0, D1;
    output Y;
    reg Y;
    always@(S, D0, D1) begin
        Y <= (~S & D0) | (S & D1);
    end
endmodule 