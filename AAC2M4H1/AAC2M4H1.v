module ALU (
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);

  parameter
    a = 3'b000,
    add = 3'b001,
    subtract = 3'b010,
    aND = 3'b011,
    oR = 3'b100,
    incrementA = 3'b101,
    decrementB  = 3'b110,
    b = 3'b111;

  always@(A or B) begin
    case (Op_code)
      a : Y = A;
      add : Y = A + B;
      subtract : Y = A - B;
      aND : Y = A & B;
      oR : Y = A | B;
      incrementA : Y = A + 1;
      decrementB : Y = B - 1;
      b : Y = B;
    endcase
  end
endmodule