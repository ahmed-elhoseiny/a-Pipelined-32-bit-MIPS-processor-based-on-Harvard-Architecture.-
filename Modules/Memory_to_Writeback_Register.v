module Memory_to_Writeback_Register #(
parameter ReadDat_width = 32 ,
          ALUOut_width = 32 ,
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




endmodule