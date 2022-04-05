module branch_taken (
    input wire branch,
    input wire [31:0] result,
    output wire pc_sel
);

    if(result == 32'b0 && branch ) begin
        pc_sel <= 1'b1;
    end
    else begin
        pc_sel <= 1'b0;
    end