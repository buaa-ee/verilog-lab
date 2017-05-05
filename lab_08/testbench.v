`timescale 1ns / 1ps
`define clk_prd 10 
`define sys_ini 100

module test;

    reg clk, rst_n, in;
	wire out;

	sequence_detect inst(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);
    end

	initial begin 
		clk = 0;
		forever #(`clk_prd/2.0) clk = ~clk;
	end

	initial begin
        rst_n = 0;
        #100
        rst_n = 1;
        #1000 $finish;
    end

    always @(negedge clk) begin
        in = $random % 2;
    end

endmodule