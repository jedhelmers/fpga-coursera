`timescale 1 ns/10 ps
`include "AAC2M4P3.v"
module FSM_tb();
  reg clk;

  initial begin
    clk = 1'b0;
    forever #2 clk = ~clk;
  end

  initial begin
    $dumpfile("FSM_tb.vcd");
    $dumpvars(0, FSM_tb);

    $display("Howdy");
    $finish;
  end
endmodule
