`timescale 1ns / 1ps
module shift_register(input reset, clk, S1, S0, shift_in, I3, I2, I1, I0, 
output reg Q3,Q2,Q1,Q0);
    reg[27:0] counter = 0;
    reg new_clk = 0;
    always @(posedge clk) begin
            counter <= counter + 1;
            if (counter == {26{1'b1}}) begin
                counter <= 0;
                new_clk <= ~new_clk;
            end
    end
        
    wire w0,w1,w2,w3;
    mux4 m0(Q0, I0, shift_in, Q1, S1, S0, w0);
    mux4 m1(Q1, I1, Q0, Q2, S1, S0, w1);
    mux4 m2(Q2, I2, Q1, Q3, S1, S0, w2);
    mux4 m3(Q3, I3, Q2, shift_in, S1, S0, w3);
    d_flip_flop d0(new_clk, reset, w0, Q0);
    d_flip_flop d1(new_clk, reset, w1, Q1);
    d_flip_flop d2(new_clk, reset, w2, Q2);
    d_flip_flop d3(new_clk, reset, w3, Q3);
    
endmodule