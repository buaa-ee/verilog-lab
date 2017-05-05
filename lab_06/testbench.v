module test;

    reg clk, rst_n;
    reg [2:0] in;
    reg [1:0] opcode;
    wire [8:0] out;

    reg [2:0] i;

    calculator unit(clk, rst_n, in, opcode, out);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);
    end

    initial begin
        clk = 0;
        in = 0;
        opcode = 2'b11;
        rst_n = 0;

        #10 rst_n = 1;
        
        #10 opcode = 0;
        for(i = 0; i <= 5; i = i + 1) #10 in = i;

        #10 opcode = 1;
        for(i = 0; i <= 5; i = i + 1) #10 in = i;

        #10 opcode = 2;
        for(i = 0; i <= 5; i = i + 1) #10 in = i;

        $stop;
    end

    always #5 clk = ~clk;

endmodule
