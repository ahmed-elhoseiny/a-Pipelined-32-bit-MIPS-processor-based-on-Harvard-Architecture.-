module Hazard_Unit #(
parameter Rs_width = 5,
          Rt_width = 5,
          WriteReg = 5
) (

input       wire                    BranchD,
input       wire                    JumpD,
input       wire                    RsD,
input       wire                    RtD,
input       wire                    RsE,
input       wire                    RtE,
input       wire                    WriteRegE,
input       wire                    RegWriteE,
input       wire                    RegWriteM,
input       wire                    WriteRegM,
input       wire                    RegWriteW,
input       wire                    WriteRegW,
input       wire                    MemtoRegE,

output      reg                     ForwardAE,
output      reg                     ForwardBE,
output      reg                     FlushE,
output      reg                     ForwardAD,
output      reg                     ForwardBD,
output      reg                     StallF,
output      reg                     StallD,
);



endmodule