`timescale 1ns/1ps
`define clk_halfcycle 50

module test;

    reg  clk, rst_n;
    wire clk_out1, clk_out2;

    half_clk inst (
        .clk(clk),
        .rst_n(rst_n),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2)
        );

    always #(`clk_halfcycle) clk=~clk;

    initial begin
        clk = 0;
        rst_n = 1;

        #10  rst_n = 0;
        #190 rst_n = 1;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,inst);
        #2000 $stop;
    end

endmodule
