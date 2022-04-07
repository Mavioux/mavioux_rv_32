module control (
    input wire reset,
    input wire[6:0] opcode,
    output wire branch,
    output wire mem_rd,
    output wire mem_to_regs,
    output wire[3:0] alu_op,
    output wire mem_wr,
    output wire alu_src
    output wire reg_wr
);

    always @* begin
        if(!reset) begin
            case (opcode)
                RTYPE: begin
                    branch = 1'b0;
                    mem_rd = 1'b0;
                    mem_to_regs = 1'b0;
                    alu_op = 4'b0010;
                    mem_wr = 1'b0;
                    alu_src = 1'b0;
                    reg_wr = 1'b1;
                end

                ITYPE: begin
                    branch = 1'b0;
                    mem_rd = 1'b1;
                    mem_to_regs = 1'b1;
                    alu_op = 4'b0000;
                    mem_wr = 1'b0;
                    alu_src = 1'b1;
                    reg_wr = 1'b1;
                end

                STYPE: begin
                    branch = 1'b0;
                    mem_rd = 1'b0;
                    mem_to_regs = 1'b0;
                    alu_op = 4'b0000;
                    mem_wr = 1'b1;
                    alu_src = 1'b1;
                    reg_wr = 1'b0;
                end

                JTYPE: begin
                    branch = 1'b1;
                    mem_rd = 1'b0;
                    mem_to_regs = 1'b0;
                    alu_op = 4'b0111;
                    mem_wr = 1'b0;
                    alu_src = 1'b0;
                    reg_wr = 1'b0;
                end
            endcase

    end

endmodule