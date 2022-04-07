module jump_adder (
    input wire reset,
    input wire[31:0] read_addr,
    input wire[31:0] jump_adder
    output wire[31:0] jump_addr
);

    always @* begin
        if (!reset) begin
            jump_addr = read_addr + jump_adder;
        end
    end

endmodule