module alu_max (
    input wire reset,
    input wire im_gen,
    input wire rdb,
    input wire alu_src
    output wire rdx
);

    always @* begin
        if(!reset) begin
            if(alu_src) begin
                rdx <= im_gen;
            end
            else begin
                rdx <= rdb;
            end
        end
    end
endmodule