module compare_byte(
    input  wire [7:0] byte_a, byte_b,
    output reg ga
);

    always @(byte_a, byte_b) begin
        ga = byte_a > byte_b ? 1 : 0;
    end

endmodule
