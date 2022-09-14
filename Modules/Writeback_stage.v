module Writeback_stage #(
parameter   ReadDat_width = 32 ,
            ALUOut_width = 32 
) (
input wire                                          RegWriteW,
input wire                                          MemtoRegW,
input wire      [ALUOut_width-1:0]                  ALUOutW,
input wire      [ReadDat_width-1:0]                 ReadDataW,
input wire      [WriteReg_width-1:0]                WriteRegW,

output wire
);
    
endmodule