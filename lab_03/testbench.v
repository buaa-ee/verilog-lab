`timescale 1ns/1ps
`define clk_halfcycle 50

module test;

    reg clk_10m, rst_n;
    wire out;

    generator inst (
        .clk_10m(clk_10m),
        .rst_n(rst_n),
        .out(out)
        );

    always #(`clk_halfcycle) clk_10m=~clk_10m;

    initial begin
        clk_10m = 0;
        rst_n = 1;

        #10 rst_n = 0;
        #10 rst_n = 1;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,inst);
        #150000 $stop;
    end

endmodule
