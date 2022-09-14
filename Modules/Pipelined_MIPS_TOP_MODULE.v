module Pipelined_MIPS_TOP_MODULE #(
parameter Test_Value_width = 16,
) (
input wire                                    CLK, RST,
output wire      [Test_Value_width-1:0]       Test_Value_M   
);
    

Hazard_Unit #(
                .Rs_width(),
                .Rt_width() ,
                .WriteReg_width(),
                .ForwardAE_width(),
                .ForwardBE_width()
             )      Hazard_Unit_U1
(
.BranchD(),
.JumpD(),
.RsD(),
.RtD(),
.RsE(),
.RtE(),
.WriteRegE(),
.RegWriteE(),
.RegWriteM(),
.WriteRegM(),
.RegWriteW(),
.WriteRegW(),
.MemtoRegE(),

.ForwardAE(),
.ForwardBE(),
.FlushE(),
.ForwardAD(),
.ForwardBD(),
.StallF(),
.StallD()
);


Fetch_stage #(
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

endmodule