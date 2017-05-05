module generator(
    input  wire clk_10m, rst_n,
    output reg  out
    );

    reg [8:0] counter_500;

    always @(posedge clk_10m or negedge rst_n) begin
        if (~rst_n) begin
            counter_500 <= 0;
            out <= 0;
        end else begin
            if (counter_500 == 500) counter_500 <= 0;
            else begin
                counter_500 <= counter_500 + 1;
                if (counter_500 == 200) out <= 1;
                else if (counter_500 == 300) out <= 0;
            end
        end
    end

endmodule
