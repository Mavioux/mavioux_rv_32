module pc_mux (
    input wire reset,
    input wire[31:0] pc_adder,
    input wire pc_sel,
    input wire[31:0] jmp_addr,
    output wire[31:0] pc
);

    always @* begin
        if(!reset) begin
            if pc_sel begin
                pc <= jmp_addr;
            end
            else begin
                pc <= pc_adder;
            end
        end
    end
endmodule