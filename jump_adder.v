module jump_adder (
    input wire reset,
    input wire[31:0]  previous_pc,
    input wire[31:0] jump_adder
    output wire[31:0] jump_addr
);

    always @* begin
        if (!reset) begin
            jump_addr = previous_pc + jump_adder;
        end
    end

endmodule