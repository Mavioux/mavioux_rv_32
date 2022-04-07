module reg_file (
    input wire reset,
    input wire clock,
    input wire [4:0] ra,
    input wire [4:0] rb,
    input wire [4:0] wa,
    input wire [31:0] wda,
    input wire reg_wr,
    output wire rda,
    output wire rdb
);

    reg [31:0] registers = 32'b0;

    always @* begin
        if(!reset) begin
            if (ra != 5'b0) begin
                rda <=registers[ra];
            end
            
            if (rb != 5'b0) begin
                rdb <=registers[rb];
            end
        end
    end

    always @(posedge clock) begin
        if(!reset) begin
            if(reg_wr && wa > 1'b0) begin
                registers[wa] <= wda;
            end
        end
    end
endmodule