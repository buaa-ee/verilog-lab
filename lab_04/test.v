`timescale 1ns/100ps
//`include"./blocking1.v"
//`include"./blocking2.v"   

module test;
  wire [3:0] b1,c1,b2,c2;
  reg [3:0] a;
  reg  clk;
  
    initial begin 
        clk = 0;
    end

    always #50 clk=~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, test);
        #1000 $stop;
    end

    initial begin
        a=4'h3;
        $display("________");
        #100 a=4'h7;
        $display("________");
        #100 a=4'hf;
        $display("________");
        #100 a=4'ha;
        $display("________");
        #100 a=4'h2;
        $display("________");
        #100 
        $display("________");
        $stop;
    end
  
  blocking1 blocking1(clk,a,b2,c2);    
  
  blocking2 blocking2(clk,a,b1,c1);
endmodule

