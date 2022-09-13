module Decode_stage #(
parameter  Instr_width = 32 ,
           PCPlus4_width = 32 ,
           PCBranch_width = 32 ,
           WriteReg_width = 5 ,
           MUX_WB_width = 32 ,
           ALU_Control_width = 3 ,
           PCSrcD_width = 2 ,
           ALUOut_width = 32 ,
           WIDTH = 32 ,
           Rs_width = 5 ,
           Rt_width = 5 ,
           Rd_width = 5 ,
           SignImm_width = 32 
) (
input wire                                       CLK, 
input wire                                       RST,
input wire          [Instr_width-1:0]            InstrD, 
input wire          [PCPlus4_width-1:0]          PCPlus4D,
input wire          [WriteReg_width-1:0]         WriteRegW,
input wire                                       RegWriteW,
input wire          [MUX_WB_width-1:0]           MUX_WB_ReadDataW_or_ALUOutW,
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
output wire         [PCBranch_width-1:0]         PCBranchD,
output wire         [WIDTH-1:0]                  RD1_E, RD2_E,
output wire         [Rs_width-1:0]               RsE,
output wire         [Rt_width-1:0]               RtE,
output wire         [Rd_width-1:0]               RdE,
output wire         [SignImm_width-1:0]          SignImmD
);

wire                                EqualD;
wire     [ALUOut_width-1:0]         MUX_D_RD1_or_ALUOutM;
wire     [ALUOut_width-1:0]         MUX_D_RD2_or_ALUOutM;


Control_Unit #(
            .Funct_width(),
            .Opcode_width(),  
            .ALU_Control_width(),
            .ALU_OP_width ()
            ) Control_Unit_U1
(
.Opcode(),
.Funct(),

.RegWrite(),
.MemtoReg(),
.MemWrite(),
.ALUControl(),
.ALUSrc(),
.RegDst(),
.Jump(),
.Branch()
);

AND_gate #(.WIDTH() ) AND_gate_BranchD_EqualD_U1
(
.In1(),
.In2(),

.out()
);


OR_gate #(.WIDTH() ) OR_gate_PCSrcD_0_1_U1
(
.In1(),
.In2(),

.out()
);

comparator #(
           .in1_width(),   
           .in2_width()
            ) comparator_EqualD_U1
(
.in1(),
.in2(),

.out_signal()
);

MUX_2_to_1 #(.WIDTH()) MUX_2_to_1_RD1_U1
(
.In1(),
.In2(),
.sel(),

.out()
);

MUX_2_to_1 #(.WIDTH()) MUX_2_to_1_RD2_U2
(
.In1(),
.In2(),
.sel(),

.out()
);


Register_File #(
                .WIDTH(),
                .DEPTH(), 
                .REG_ADDR()
               )  Register_File_U1
( 
.A1(),
.A2(),
.A3(),
.WE3(),
.WD3(),
.CLK(),
.RST(),

.RD1(),
.RD2()
);







endmodule