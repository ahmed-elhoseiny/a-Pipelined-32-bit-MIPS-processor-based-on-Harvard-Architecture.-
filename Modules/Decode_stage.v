module Decode_stage #(
parameter  Instr_width = 32 ,
           PCPlus4_width = 32 ,
           PCBranch_width = 32 ,
           WriteReg_width = 5 ,
           Result_width = 32 ,
           ALU_Control_width = 3 ,
           PCSrcD_width = 2 ,
           ALUOut_width = 32 ,
           WIDTH = 32 ,
           Rs_width = 5 ,
           Rt_width = 5 ,
           Rd_width = 5 ,
           SignImm_width = 32 ,
           shifted_SignImmD_width = 32 ,
           shifted_Instr_0to25_width = 28
) (
input wire                                       CLK, 
input wire                                       RST,
input wire          [Instr_width-1:0]            InstrD, 
input wire          [PCPlus4_width-1:0]          PCPlus4D,
input wire          [WriteReg_width-1:0]         WriteRegW,
input wire                                       RegWriteW,
input wire                                       ForwardAD,
input wire                                       ForwardBD,
input wire          [Result_width-1:0]           ResultW,
input wire          [ALUOut_width-1:0]           ALUOutM,



output wire                                      RegWriteD,
output wire                                      MemtoRegD,
output wire                                      MemWriteD,
output wire         [ALU_Control_width-1:0]      ALUControlD,
output wire                                      ALUSrcD,
output wire                                      RegDstD,
output wire                                      JumpD,
output wire                                      BranchD,
output wire         [PCSrcD_width-1:0]           PCSrcD,
output wire                                      OR_PCSrcD_0or1;
output wire         [PCBranch_width-1:0]         PCBranchD,
output wire         [WIDTH-1:0]                  RD1_D, RD2_D,
output wire         [Rs_width-1:0]               RsD,
output wire         [Rt_width-1:0]               RtD,
output wire         [Rd_width-1:0]               RdD,
output wire         [SignImm_width-1:0]          SignImmD
);

wire                                     EqualD;
wire     [ALUOut_width-1:0]              MUX_D_RD1_or_ALUOutM;
wire     [ALUOut_width-1:0]              MUX_D_RD2_or_ALUOutM;
wire     [shifted_SignImmD_width-1:0]    shifted_SignImmD;
wire     [shifted_Instr_0to25_width-1:0] shifted_Instr_0to25;
wire                                     Add_BranchD_and_EqualD;      

Control_Unit #(
            .Funct_width(6),
            .Opcode_width(6),  
            .ALU_Control_width(ALU_Control_width),
            .ALU_OP_width (2)
            ) Control_Unit_U1
(
.Opcode(InstrD[31:26]),
.Funct(InstrD[5:0]),

.RegWrite(RegWriteD),
.MemtoReg(MemtoRegD),
.MemWrite(MemWriteD),
.ALUControl(ALUControlD),
.ALUSrc(ALUSrcD),
.RegDst(RegDstD),
.Jump(JumpD),
.Branch(BranchD)
);

AND_gate     AND_gate_BranchD_EqualD_U1
(
.In1(EqualD),
.In2(BranchD),

.out(Add_BranchD_and_EqualD)
);

assign PCSrcD = {JumpD , Add_BranchD_and_EqualD};

OR_gate      OR_gate_PCSrcD_0_1_U1
(
.In1(PCSrcD[0]),
.In2(PCSrcD[1]),

.out(OR_PCSrcD_0or1)
);

comparator #(
           .in1_width(WIDTH),   
           .in2_width(WIDTH)
            ) comparator_EqualD_U1
(
.in1(MUX_D_RD1_or_ALUOutM),
.in2(MUX_D_RD2_or_ALUOutM),

.out_signal(EqualD)
);

MUX_2_to_1 #(.WIDTH(WIDTH)) MUX_2_to_1_RD1_U1
(
.In1(RD1_D),
.In2(ALUOutM),
.sel(ForwardAD),

.out(MUX_D_RD1_or_ALUOutM)
);

MUX_2_to_1 #(.WIDTH(WIDTH)) MUX_2_to_1_RD2_U2
(
.In1(RD2_D),
.In2(ALUOutM),
.sel(ForwardBD),

.out(MUX_D_RD2_or_ALUOutM)
);


Register_File #(
                .WIDTH(Instr_width),
                .DEPTH(100), 
                .REG_ADDR(5)
               )  Register_File_U1
( 
.A1(InstrD[25:21]),
.A2(InstrD[20:16]),
.A3(WriteRegW),
.WE3(RegWriteW),
.WD3(ResultW),
.CLK(CLK),
.RST(RST),

.RD1(RD1_D),
.RD2(RD2_D)
);

Sign_Extend #(
            .Extend_width(SignImm_width), 
            .Imm_width(16)
             )   Sign_Extend_SignImmD_U1
(
.Imm(InstrD[15:0]),
.SignImm(SignImmD)
);


shift_left_twice #(
                    .IN_width(SignImm_width),
                    .OUT_width(shifted_SignImmD_width)
                  )  shift_left_twice_SignImmD_U1
(
.IN(SignImmD),
.OUT(shifted_SignImmD)
);


shift_left_twice #(
                    .IN_width(shifted_Instr_0to25_width),
                    .OUT_width(shifted_Instr_0to25_width)
                  )  shift_left_Instr_0to25_U1
(
.IN({2'b00 , InstrD[25:0]}),
.OUT(shifted_Instr_0to25)
);


endmodule