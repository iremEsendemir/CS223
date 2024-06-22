`timescale 1ns / 1ps

module four_digit_bcd_counter(
      input logic clk,
      input logic [15:0] sw,
      input logic btnU,//reset
      input logic btnL,//load
      output logic [0:6] seg,
      output logic [3:0] an
    );
    reg [15:0] cnt;
    integer a = 0;
    multi_digit_displayer mdt(clk, cnt, seg, an);
    always_ff @(posedge clk) begin
        a = a + 1;
        if (a > 50000000) begin
            cnt <= cnt  + 1;
            if (btnU) begin
                cnt <= 16'b0000000000000000;
            end else if (btnL) begin
                cnt <= sw;
            end else if (cnt[15:0] == 16'b1001100110011001) begin
                cnt[15:0] <= 0;
            end else if (cnt[11:0] == 12'b100110011001) begin
                cnt[11:0] <= 12'b000000000000;
                cnt[15:12] <= cnt[15:12] + 1;
            end else if (cnt[7:0] == 8'b10011001) begin
                cnt[7:0] <= 8'b00000000;
                cnt[11:8] <= cnt[11:8] + 1;
            end else if (cnt[3:0] == 4'b1001) begin
                cnt[3:0] <= 4'b0000;
                cnt[7:4] <= cnt[7:4] + 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
            end else begin
                cnt[3:0] <= cnt[3:0] + 1;
            end
            a = 0;
        end
    end
    
endmodule