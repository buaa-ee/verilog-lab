module calculator (
    input  wire clk, rst_n,
    input  wire [2:0] in,
    input  wire [1:0] opcode,
    output reg [8:0] out
    );

    function [8:0] square (input [2:0] in);
        square = in*in;
    endfunction

    function [8:0] cube (input [2:0] in);
        cube = in*in*in;
    endfunction

    function [8:0] factorial (input [2:0] in);
        case (in)
            0: factorial = 1;
            1: factorial = 1;
            2: factorial = 1*2;
            3: factorial = 1*2*3;
            4: factorial = 1*2*3*4;
            5: factorial = 1*2*3*4*5;
            default: factorial = 0;
        endcase
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) out = 0;
        else begin
            case (opcode)
                0: out = square(in);
                1: out = cube(in);
                2: out = factorial(in);
                default: out = 0;
            endcase
        end
    end

endmodule
