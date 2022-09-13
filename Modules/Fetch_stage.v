module Fetch_stage #(
parameter PCPlus4_width = 32 ,
          PCSrcD_width = 2 ,
          Instr_width = 32 ,
          PCBranch_width = 32 ,
          PCJump_width = 32 ,
          PC_in_width = 32 ,
          PCF_width = 32
) (
input wire                                 CLK,
input wire                                 RST,
input wire      [PCSrcD_width-1:0]         PCSrcD,
input wire      [PCBranch_width-1:0]       PCBranchD,
input wire      [PCJump_width-1:0]         PCJump,
input wire                                 StallF,

output wire     [PCPlus4_width-1:0]        PCPlus4F,    
output wire     [Instr_width-1:0]          InstrF 
);

wire [PCF_width-1:0]    PCF;
wire [PC_in_width-1:0]  PC_in;

MUX_4_to_1  #(  .IN_WIDTH(PCPlus4_width), 
                .OUT_WIDTH(PC_in_width),
                .sel_WIDTH(PCSrcD_width)
             )   MUX_4_to_1_PC_in_U1 
(
.In1(PCPlus4F),
.In2(PCBranchD),
.In3(PCJump),
.In4('d0),
.sel(PCSrcD),
.out(PC_in)
);


Program_Counter #( .PC_in_width(PC_in_width),
                   .PC_out_width(PCF_width)
                 ) Program_Counter_PCF_U1
(
.CLK(CLK),
.RST(RST),
.EN(StallF),
.PC_in(PC_in),
.PC_out(PCF)
);


Adder #( .WIDTH(PCF_width) )  Adder_PCPlus4F_U1
(
.IN_1(PCF),
.IN_2('d4),
.OUT(PCPlus4F)
);


Instruction_Memory #( .WIDTH(PCF_width), 
                      .DEPTH(100)
                    )   Instruction_Memory_InstrF_U1
(
.A(PCF),
.RD(InstrF)
);




endmodule