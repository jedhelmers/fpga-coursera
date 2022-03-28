`timescale 1 ns/10 ps
`include "AAC2M4P2.v"
module RAM128x32_tb();

  parameter Data_width = 32;  //# of bits in word
  parameter Addr_width = 7;  // # of address bits

  reg clk = 0;
  reg we;
  reg [(Addr_width-1):0] address;
  reg [(Data_width-1):0] d;
  wire [(Data_width-1):0] q;

  RAM128x32 #(
      .Data_width(Data_width),
      .Addr_width(Addr_width)
    )
    ram
    (
      .clk(clk),
      .we(we),
      .address(address),
      .d(d),
      .q(q)
    );


  initial begin
    clk = 1'b0;
    forever #2 clk = ~clk;
  end

  initial begin
    $dumpfile("RAM128x32_tb.vcd");
    $dumpvars(0, RAM128x32_tb);
    
    we = 1;
    for(integer i = 0; i < {Addr_width{1'b1}}; i++) begin
      d <= i << 8;
      address <= i; #10;
      $display("WRITE: %d %d", address, d);
    end

    we = 0; #10;
    for(integer j = 0; j < {Addr_width{1'b1}}; j++) begin
      address <= j; #10;
      $display("READ:  %d %d", address, q);
    end

    we = 1;
    d <= 23456;
    address <= 34; #20;
    $display("WRITE: %d %d", address, q);
    we = 0; #20;
    $display("READ:  %d %d", address, q);

    $display("Howdy");
    $finish;
  end
endmodule
