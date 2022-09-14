module Memory_stage #(
parameter   ALUOut_width = 32 ,
            WriteData_width = 32 ,
            WriteReg_width = 5 ,
            ReadDat_width = 32 ,
            Test_Value_width =16 
) (
input wire                                   RegWriteM,
input wire                                   MemtoRegM,
input wire                                   MemWriteM,
input wire                                   CLK, RST,
input wire      [ALUOut_width-1:0]           ALUOutM,
input wire      [WriteData_width-1:0]        WriteDataM,
input wire      [WriteReg_width-1:0]         WriteRegM,

output wire                                  RegWriteM,
output wire                                  MemtoRegM,
output wire                                  MemWriteM,
output wire     [ReadDat_width-1:0]          ReadDataM,
output wire     [ALUOut_width-1:0]           ALUOutM,
output wire     [WriteReg_width-1:0]         WriteRegM,
output wire     [Test_Value_width-1:0]       Test_Value_M
);

Data_Memory #(
                .WIDTH(ALUOut_width),
                .DEPTH(100),
                .Test_Value_width(Test_Value_width) 
             ) Data_Memory_U1
(
.A(ALUOutM),
.WD(WriteDataM),
.WE(MemWriteM),
.CLK(CLK),
.RST(RST),

.RD(ReadDataM),
.Test_Value(Test_Value_M)
);
    
endmodule