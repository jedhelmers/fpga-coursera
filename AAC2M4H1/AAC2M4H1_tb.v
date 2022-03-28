`timescale 1 ns/10 ps
`include "AAC2M4H1.v"
module ALU_tb();
  reg clk;

  initial begin
    clk = 1'b0;
    forever #2 clk = ~clk;
  end

  initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0, ALU_tb);

    $display("Howdy");
    $finish;
  end
endmodule
