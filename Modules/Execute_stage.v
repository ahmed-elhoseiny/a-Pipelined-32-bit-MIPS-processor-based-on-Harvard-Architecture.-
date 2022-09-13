module moduleName #(
parameter ALU_Control_width = 3,
          WIDTH = 32 ,
          Rs_width = 5 ,
          Rt_width = 5 ,
          Rd_width = 5 ,
          SignImm_width = 32 ,
          Result_width = 32 ,
          ALUOut_width = 32 ,
          ForwardAE_width = 2 ,
          ForwardBE_width =2 ,
          WriteData_width =32,
          WriteReg_width = 5,


) (
input wire         [ALU_Control_width-1:0]      ALUControlE,
input wire                                      RegWriteE,
input wire                                      MemtoRegE,
input wire                                      MemWriteE,
input wire                                      RegDstE,
input wire                                      ALUSrcE,
input wire         [WIDTH-1:0]                  RD1_E,
input wire         [WIDTH-1:0]                  RD2_E,
input wire         [Rs_width-1:0]               RsE,
input wire         [Rd_width-1:0]               RdE,
input wire         [Rt_width-1:0]               RtE,
input wire         [SignImm_width-1:0]          SignImmE,
input wire         [Result_width-1:0]           ResultW,
input wire         [ALUOut_width-1:0]           ALUOutM,
input wire         [ForwardAE_width-1:0]        ForwardAE,
input wire         [ForwardBE_width-1:0]        ForwardBE,


output wire                                     RegWriteE,
output wire                                     MemtoRegE,
output wire                                     MemWriteE,
output wire        [ALUOut_width-1:0]           ALUOutE,
output wire        [WriteData_width-1:0]        WriteDataE,
output wire        [WriteReg_width-1:0]         WriteRegE

);
    
wire       [WIDTH-1:0]          SrcAE;
wire       [WIDTH-1:0]          SrcBE;



ALU #(
    .ALUResult_width(ALUOut_width),
    .ALU_Control_width(ALU_Control_width)
     )    ALU_E_U1
(
.SrcA(SrcAE),
.SrcB(SrcBE),
.ALUControl(ALUControlE),

.ALUResult(ALUOutE)
);


MUX_2_to_1 #(.WIDTH(WriteData_width)) MUX_2to1_SrcBE_U1
(
.In1(WriteDataE),
.In2(SignImmE),
.sel(ALUSrcE),

.out(SrcBE)
);


MUX_2_to_1 #(.WIDTH(Rt_width)) MUX_2to1_WriteRegE_U2
(
.In1(RtE),
.In2(RDE),
.sel(RegDstE),

.out(WriteRegE)
);


MUX_4_to_1  #(  .IN_WIDTH(WIDTH), 
                .OUT_WIDTH(WIDTH),
                .sel_WIDTH(ForwardAE_width)
             )   MUX_4to1_SrcAE_U1 
(
.In1(RD1_E),
.In2(ResultW),
.In3(ALUOutM),
.In4('b0),
.sel(ForwardAE),
.out(SrcAE)
);


MUX_4_to_1  #(  .IN_WIDTH(WIDTH), 
                .OUT_WIDTH(WriteData_width),
                .sel_WIDTH(ForwardBE_width)
             )   MUX_4to1_WriteDataE_U2 
(
.In1(RD2_E),
.In2(ResultW),
.In3(ALUOutM),
.In4('b0),
.sel(ForwardBE),
.out(WriteDataE)
);


endmodule