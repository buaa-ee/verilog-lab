module half_clk (
    input  wire clk, rst_n,
    output reg  clk_out1, clk_out2
    );
    
    always @(posedge clk) begin
        if (~rst_n)
            clk_out1 <= 0;
        else
            clk_out1 <= ~clk_out1;
    end

    always @(clk_out1) clk_out2 = ~clk_out1;

endmodule
