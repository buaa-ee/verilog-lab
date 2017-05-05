module sequence_detect(
    input  wire clk, rst_n,
    input  wire in,
    output reg out
    );

    reg [4:0] state;

    parameter s0 = 5'b00001,
              s1 = 5'b00010,
              s2 = 5'b00100,
              s3 = 5'b01000,
              s4 = 5'b10000;

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) state <= s0;
        else case (state)
            s0 : state <= in ? s1 : s0;
            s1 : state <= in ? s2 : s0;
            s2 : state <= in ? s3 : s0;
            s3 : state <= in ? s4 : s0;
            s4 : state <= in ? s4 : s0;
            default: state <= s0;
        endcase
    end

    always @(state) begin
        out = (state == s4) ? 1 : 0;
    end

endmodule