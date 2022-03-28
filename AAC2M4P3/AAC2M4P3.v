module FSM(
  input In1,
  input RST,
  input CLK,
  output reg Out1
);

  parameter
    A = 3'b001,
    B = 3'b010,
    C = 3'b100;

  reg [2:0] present, next;
  always @(posedge CLK) begin
    if(RST)
      present <= A;
    else
      present <= next;
  end

  always @(posedge CLK) begin
    next = A;
    case( present )
      A : begin if(In1) next = B; end
      B : begin if(~In1) next = C; end
      C : begin if(In1) next = A; end
    endcase
    Out1 = present == C ? 1 : 0;
  end
endmodule