module instruction_mem (
    input wire reset,
    input wire[31:0] read_addr,
    output wire[6:0] opcode,
    output wire[4:0] ra,
    output wire[4:0] rb,
    output wire[4:0] wa,
    output wire[31:0] instruction
);

    reg[128][31] inst_ram;

    always @* begin
        if (!reset) begin
            instruction = inst_ram[read_addr];
            opcode = instruction[6:0];

            case (opcode)
                RTYPE: begin
                    w_a = instruction[11:7];
                    ra = instruction[19:15];
                    rb = instruction[24:20];
                end
                ITYPE: begin
                    w_a = instruction[11:7];
                    ra = instruction[19:15];
                end
                STYPE: begin
                    w_a = instruction[24:20];
                    ra = instruction[19:15];
                    rb = instruction[24:20];
                end
                JTYPE: begin
                    ra = instruction[19:15];
                    rb = instruction[24:20];
                end
            endcase
        end
    end

endmodule