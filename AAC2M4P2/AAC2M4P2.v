module RAM128x32
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address,
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );

  reg [Data_width - 1: 0] temp;
  reg [Data_width - 1: 0] ram [(Addr_width-1):0];

  assign q = we ? {Data_width{1'bz}} : ram[address];

  always @(posedge clk) begin
    if (we)
      // $display("%d", address);
      ram[address] <= d;
  end

  always @(posedge clk) begin
    if (!we)
      // $display("%d", address);
      temp <= ram[address];
  end
endmodule