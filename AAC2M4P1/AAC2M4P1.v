/*
  74LS161a replacement
  4-bit binary counter
  for Coursera course: Hardware Description Languages

  D:        Parallel Input
  CLK:      Clock
  CLR_n:    Asynchronous Reset (LOW)
  LOAD_n:   Enable Parallel Input (LOW)
  ENP:      Count Enable Parallel
  ENT:      Count Enable Trickle
  Q:        Parallel Output
  RCO:      Ripple Carry Output (Terminal Count)

*/
module LS161a(
    input [3:0] D,
    input CLK,
    input CLR_n,
    input LOAD_n,
    input ENP,
    input ENT,
    output RCO,
    output [3:0]Q
);
  reg [3:0] CNT = 4'b0000;
  reg rco = 0;

  assign Q = CNT[3:0];
  assign RCO = rco;

  always @(posedge CLK or negedge LOAD_n) begin
    if (!LOAD_n) begin
      CNT = D;
    end
  end

  always @(negedge CLR_n) CNT <= 4'b0000;

  always @(posedge CLK) begin
    else begin
      if (ENP and ENT) begin
        rco = CNT[0] & CNT[1] & CNT[2] & CNT[3] + 1'b1;
        CNT = CNT + 1;
      end
    end
  end
endmodule