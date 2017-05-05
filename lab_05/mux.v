module mux (
    input  wire [3:0] a0, a1, a2, a3, a4, a5, a6, a7,
    input  wire [3:0] c,
    output reg [3:0] out
    );

    always @* begin
        case (c) 
            3'b000: out=a0;
            3'b001: out=a1;
            3'b010: out=a2;
            3'b011: out=a3;
            3'b100: out=a4;
            3'b101: out=a5;
            3'b110: out=a6;
            3'b111: out=a7;
        endcase
    end

endmodule
