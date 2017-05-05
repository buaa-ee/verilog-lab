module test;

    reg [3:0] a0, a1, a2, a3, a4, a5, a6, a7;
    reg [3:0] c;
    wire [3:0] out;

    mux inst (a0,a1,a2,a3,a4,a5,a6,a7,c,out);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);
        #100 $stop;
    end

    initial begin
        c = 0;
        a0 = 0;
        a1 = 1;
        a2 = 2;
        a3 = 3;
        a4 = 4;
        a5 = 5;
        a6 = 6;
        a7 = 7;
    end

    always #10 c = {$random}%8;

endmodule
