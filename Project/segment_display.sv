`timescale 1ns / 1ps
module segment_display(
    input logic clk,
    input logic btnU,
    input logic btnR,
    input logic btnL,
    input logic [3:0][7:0] Tdatas,
    input logic [3:0][7:0] Rdatas,
    output logic [3:0]an,
    output logic [0:6]seg
);
    logic [0:6] showTorR;
    logic [0:6] showIndex;
    logic [3:0] data1;
    logic [3:0] data2;
    logic [0:6] showData1;
    logic [0:6] showData2;
    logic [3:0] index;
    logic isT;
    logic btnU_db;
    logic btnR_db;
    logic btnL_db;
    initial begin
        index <= 0;
        isT <= 1;
        data1[3:0] <= Tdatas[0][3:0];
        data2[3:0] <= Tdatas[0][7:4];
        btnU_db <= 0;
    end
    reg [1:0] active_digit = 0;
    integer refresh_counter = 0;
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        if (refresh_counter == 250000) begin
            refresh_counter <= 0;
            active_digit <= active_digit + 1;
            if (active_digit == 3) active_digit <= 0;
        end
    end
    always @(*) begin
        case (active_digit)
        2'b00: begin
        seg = showData1;
        an = 4'b1110;
        end
        2'b01: begin
        seg = showData2;
        an = 4'b1101;
        end
        2'b10: begin
        seg = showIndex;
        an = 4'b1011;
        end
        2'b11: begin
        seg = showTorR;
        an = 4'b0111;
        end
        endcase
    end
    always_ff@(posedge clk) begin
        if(btnU_db) begin
            isT <= ~isT;
        end
        if (btnR_db) begin
        if (index == 3)
            index <= 0;
        else
            index <= index + 1;
        end
        if (btnL_db) begin
            if (index == 0)
                index <= 3;
            else
                index <= index - 1;
        end
        if(isT)begin
            if(index != 3) begin
                showTorR <= 7'b1110000;
                data1 <= Tdatas[index][3:0];
                data2 <= Tdatas[index][7:4];
            end 
            else begin
                showTorR <= 7'b1110000;
                data1 <= Tdatas[3][3:0];
                data2 <= Tdatas[3][7:4];
            end
        end
        else begin
            showTorR <= 7'b1111010;
            data1 <= Rdatas[index][3:0];
            data2 <= Rdatas[index][7:4];
        end
    end 
    btn_debouncer b1(clk, btnU, btnU_db);
    btn_debouncer b2(clk, btnR, btnR_db);
    btn_debouncer b3(clk, btnL, btnL_db);
    bcd_to_7_segment bcd1(clk, index, showIndex);
    bcd_to_7_segment bcd2(clk, data1, showData1);
    bcd_to_7_segment bcd3(clk, data2, showData2);
endmodule