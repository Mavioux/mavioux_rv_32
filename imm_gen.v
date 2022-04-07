module immediate_generation(
    input wire reset,
    input wire[31:0] instruction,
    output wire[31:0] imm_gen
);

    always @* begin
        case (instruction[7:0])
            ITYPE: begin
                imm_gen[11:0] = instruction[31:20];
            end

            STYPE: begin
                imm_gen[11:5] = instruction[31:25];
                imm_gen[4:0] = instruction[11:7];
            end

            JTYPE: begin
                imm_gen[20] = instruction[31];
                imm_gen[19:12] = instruction[19:12];
                imm_gen[11] = instruction[20];
                imm_gen[10:1] = instruction[30:21];
                imm_gen[0] = 0
            end

        // missing if else

    end

endmodule