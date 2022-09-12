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

MUX_4_to_1  #(  .IN_WIDTH(), 
                .OUT_WIDTH(),
                .sel_WIDTH()
                )   PC_in_MUX_4_to_1_U1 
(
.In1(),
.In2(),
.In3(),
.In4(),
.sel(),
.out()
);



endmodule