module Memory_to_Writeback_Register #(
parameter ReadDat_width = 32 ,
          ALUOut_width = 32 ,
          WriteReg_width = 5
) (
input wire                                   CLK,
input wire                                   RST,
input wire                                   RegWriteM,
input wire                                   MemtoRegM,
input wire      [ReadDat_width-1:0]          ReadDataM,
input wire      [ALUOut_width-1:0]           ALUOutM,
input wire      [WriteReg_width-1:0]         WriteRegM,

output reg                                   RegWriteW,
output reg                                   MemtoRegW,
output reg      [ReadDat_width-1:0]          ReadDataW,
output reg      [ALUOut_width-1:0]           ALUOutW,
output reg      [WriteReg_width-1:0]         WriteRegW
);

reg  [2+ReadDat_width+ALUOut_width+WriteReg_width-1:0]    OUT_s;
wire [2+ReadDat_width+ALUOut_width+WriteReg_width-1:0]    IN_s;

assign  {RegWriteW, MemtoRegW, ReadDataW, ALUOutW, WriteRegW} = OUT_s ;
assign  IN_s = {RegWriteM, MemtoRegM, ReadDataM, ALUOutM, WriteRegM} ;

always @(posedge CLK or negedge RST) begin
   if (!RST) begin
    OUT_s <= 'd0;
   end else begin
    OUT_s <= IN_s;
   end
end

endmodule