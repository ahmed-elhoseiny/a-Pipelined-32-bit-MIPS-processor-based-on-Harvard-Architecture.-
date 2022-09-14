module Writeback_stage #(
parameter   ReadDat_width = 32 ,
            ALUOut_width = 32 ,
            WriteReg_width = 5 ,
            Result_width = 32
) (
input wire                                          RegWriteW,
input wire                                          MemtoRegW,
input wire      [ALUOut_width-1:0]                  ALUOutW,
input wire      [ReadDat_width-1:0]                 ReadDataW,
input wire      [WriteReg_width-1:0]                WriteRegW,


output wire     [WriteReg_width-1:0]                WriteRegW,
output wire     [Result_width-1:0]                  ResultW,
input wire                                          RegWriteW
);

MUX_2_to_1 #(.WIDTH(Result_width)) MUX_2to1_ResultW_U1
(
.In1(ReadDataW),
.In2(ALUOutW),
.sel(MemtoRegW),

.out(ResultW)
);

endmodule