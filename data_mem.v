module data_mem (
    input wire reset,
    input wire clock,
    input wire[31:0] result,
    input wire mem_wr,
    input wire mem_rd,
    input wire[31:0] rdb,
    output wire[31:0] read_data
);

    // this is not a proper implementation of ram, just a dummy register
    reg[128][32] data_ram;

    always @(posedge clock) begin
        if(!reset) begin
            if (mem_wr)
                data_ram[result] = rdb'
            else if (mem_rd)
                read_data = data_ram[result];
        end
    end

endmodule