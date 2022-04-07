module pc_adder (
    input wire reset,
    input wire step_clock,
    input wire[31:0] pc_adder,
    output wire[31:0] pc_addr
);

    always @(posedge step_clock) begin
        if (!reset) begin
            pc_addr = pc_addr + 1;
        end
    end

endmodule