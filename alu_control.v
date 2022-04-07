module alu_control (
    input wire reset,
    input wire[31:0] instruction,
    input wire[3:0] alu_op,
    output wire[3:0] alu_decode
);

    always @* begin
        if(!reset) begin
            if (alu_op == 2) begin
                if(instruction[31:25] == 0) begin
                    case (instruction[14:12])
                        0: alu_decode <= ADD;
                        1: alu_decode <= SLL;
                        2: alu_decode <= SLT;
                        3: alu_decode <= SLTU;
                        4: alu_decode <= XOR;
                        5: alu_decode <= SRL;
                        6: alu_decode <= OR;
                        7: alu_decode <= AND;
                    endcase
                end
                else if (instruction[31:25] == 32) begin
                    case (instruction[14:12] == 32) begin
                        0: alu_decode <= SUB;
                        5: alu_decode <= SRA;
                    end
                end
            end

            else if (alu_op == 0) begin
                alu_decode <= ADD;
            end

            else if (alu_op == 7) begin
                if (instruction[14:12] == 0) 
                    alu_decode <= XOR; 
            end
        end
    end 

endmodule