module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr,
  input RdInc, WrInc,
  input [8:0] DataIn,
  output [8:0] DataOut,
  input rden, wren
	);
//signal declarations

	reg [8:0] fifo_array [7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;

	integer i = 0;
  assign wr_cnt = wrptr;
  assign rd_cnt = rdptr;
  assign DataOut = rden ? fifo_array[rd_cnt] : 9'bzzzzzzz;

  always @(WrPtrClr) begin
    wrptr <= 0;
  end

  always @(RdPtrClr) begin
    rdptr <= 0;
  end

  always @(rst) begin
    rdptr <= 0;
    wrptr <= 0;
    for(i = 0; i < 256; i = i + 1) begin
      fifo_array[i] <= 9'b000000000;
    end
  end

  always @(posedge clk) begin
    // when write signal, write to array
    if(wren) begin
      fifo_array[wr_cnt] = DataIn;
      wrptr = wrptr + 1;
    end
    else if(rden) begin
      rdptr = rdptr + 1;
    end
  end
endmodule





//