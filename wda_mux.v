module wda_mux (
    input wire reset,
    input wire mem_to_regs,
    input wire [31:0] result,
    input wire [31:0] read_data,
    output wire [31:0] wda
);

    always @* begin
        if (!reset) begin
            if(mem_to_regs) begin
                wda <= read_data;
            end
            else begin
                wda <= result;
            end
        end
    end