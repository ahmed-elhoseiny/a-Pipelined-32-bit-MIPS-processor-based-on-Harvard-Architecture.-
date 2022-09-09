module Hazard_Unit #(
parameter Rs_width = 5,
          Rt_width = 5,
          WriteReg_width = 5,
          ForwardAE_width = 2,
          ForwardBE_width =2
) (

input       wire                              BranchD,
input       wire                              JumpD,
input       wire    [Rs_width-1:0]            RsD,
input       wire    [Rt_width-1:0]            RtD,
input       wire    [Rs_width-1:0]            RsE,
input       wire    [Rt_width-1:0]            RtE,
input       wire    [WriteReg_width-1:0]      WriteRegE,
input       wire                              RegWriteE,
input       wire                              RegWriteM,
input       wire    [WriteReg_width-1:0]      WriteRegM,
input       wire                              RegWriteW,
input       wire    [WriteReg_width-1:0]      WriteRegW,
input       wire                              MemtoRegE,

output      reg     [ForwardAE_width-1:0]    ForwardAE,
output      reg     [ForwardBE_width-1:0]    ForwardBE,
output      reg                              FlushE,
output      reg                              ForwardAD,
output      reg                              ForwardBD,
output      reg                              StallF,
output      reg                              StallD
);

always @(*) begin
    if ((RsE != 0) && (RsE == WriteRegM) && RegWriteM) begin
        ForwardAE = 'b10 ;   
    end else if ((RsE != 0) && (RsE == WriteRegW) && RegWriteW) begin
        ForwardAE = 'b01 ;
    end else begin
        ForwardAE = 'b00 ;    
    end
end
 
always @(*) begin
    if ((RtE != 0) && (RtE == WriteRegM) && RegWriteM) begin
        ForwardBE = 'b10 ;   
    end else if ((RtE != 0) && (RtE == WriteRegW) && RegWriteW) begin
        ForwardBE = 'b01 ;
    end else begin
        ForwardBE = 'b00 ;    
    end
end
endmodule