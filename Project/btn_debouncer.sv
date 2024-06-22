`timescale 1ns / 1ps
module btn_debouncer(
    input logic clk, button,
    output logic buttonDebounced
);
    integer timer = 0;
    typedef enum logic [1:0] {idleState, debounceState, stabilizeState} stateType;
    stateType [1:0] state = idleState;
    always_ff @(posedge clk) begin
        case (state)
        idleState: begin
            buttonDebounced <= 0;
            if(button) begin
                state <= debounceState;
            end
        end
        debounceState: begin
            timer <= timer+1;
            if(timer >= 25000)begin
                timer <= 0;
                buttonDebounced <= 1;
                state <= stabilizeState;
            end
        end
        stabilizeState: begin
            buttonDebounced <= 0;
            if(~button) begin
                state <= idleState;
            end
        end
        endcase
    end
endmodule