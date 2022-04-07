module alu (
    input wire reset,
    input wire[3:0] alu_decode,
    input wire[31:0] rda,
    input wire[31:0] rdx,
    output wire[31:0] result
);

    always @* begin
        if (!reset) begin
            case (alu_decode)
                AND: result = rda & rdx;
                OR: result = rda | rdx;
                ADD: result = rda + rdx;
                SUB: result = rda - rdx;
                XOR: result = rda ^ rdx;
                SLL: result = rda << rdx;
                // to check (signed)
                SRL: result = rda >> rdx;
                SLT: begin
                    // check for unsigned
                    if (rda < rdx)
                        result = 1'b1;
                    else
                        result = 1'b0;
                end
                SLTU: begin
                    //check for signed
                    if (rda < rdx)
                        result = 1'b1;
                    else
                        result = 1'b0;
                end
                SRA: begin
                    if (rda[31] == 0)
                        result = rda >> rdx
                    else if (rda[31] == 1) begin
                        // something weird here 
                    end 
                end
        end
    end

endmodule