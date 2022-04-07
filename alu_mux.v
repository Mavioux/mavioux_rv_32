module alu_mux (
    input wire reset,
    input wire im_gen,
    input wire[31:0] rdb,
    input wire alu_src
    output wire[31:0] rdx
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