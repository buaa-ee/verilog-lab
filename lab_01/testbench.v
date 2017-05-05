`timescale 1ns/1ns
module test;

    reg [7:0]a,b;
    reg clk;
    wire ga;
  
    compare_byte inst(
        .byte_a(a),
        .byte_b(b),
        .ga(ga)
        );
    
    initial begin
        a=0;
        b=0;
        clk=0;
    end

    always #100 clk=~clk;
    
    always @(posedge clk) begin
        a=$random%128;
        b=$random%128;
    end

    initial begin 
        $dumpfile("wave.vcd");
        $dumpvars(0,inst);
        #100000 $stop;
    end

endmodule
