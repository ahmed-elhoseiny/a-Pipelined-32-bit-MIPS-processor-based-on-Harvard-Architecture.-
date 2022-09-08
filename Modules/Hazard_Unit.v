module Hazard_Unit #(
parameter Rs_width = 5,
          Rt_width = 5,
          WriteReg = 5
) (

input       wire                        BranchD,
input       wire                        JumpD,
input       wire    [Rs_width-1:0]      RsD,
input       wire    [Rt_width-1:0]      RtD,
input       wire    [Rs_width-1:0]      RsE,
input       wire    [Rt_width-1:0]      RtE,
input       wire    [WriteReg-1:0]      WriteRegE,
input       wire                        RegWriteE,
input       wire                        RegWriteM,
input       wire    [WriteReg-1:0]      WriteRegM,
input       wire                        RegWriteW,
input       wire    [WriteReg-1:0]      WriteRegW,
input       wire                        MemtoRegE,

output      reg                         ForwardAE,
output      reg                         ForwardBE,
output      reg                         FlushE,
output      reg                         ForwardAD,
output      reg                         ForwardBD,
output      reg                         StallF,
output      reg                         StallD
);



endmodule