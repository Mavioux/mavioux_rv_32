module pc_assign (
    input wire reset,
    input wire[31:0] read_addr,
    output wire[31:0] pc
);
    always @* begin
        if (!reset) begin
            read_addr = pc;
        end
    end

endmodule