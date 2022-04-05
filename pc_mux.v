module pc_mux (
    input wire reset,
    input wire pc_adder,
    input wire pc_sel,
    input wire jmp_addr,
    output wire pc
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