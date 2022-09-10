module Decode_to_Execute_Resister #(
parameter ALU_Control_width = 3 ,
          Rs_width = 5 ,
          Rt_width = 5 ,
          Rd_width = 5 ,
          WIDTH = 32 ,
          SignImm_width = 32 

) (
input wire                              CLK, RST, CLR,
input wire                              MemWriteD,
input wire                              MemtoRegD,
input wire  [ALU_Control_width-1:0]     ALUControlD,
input wire                              ALUSrcD,
input wire                              RegWriteD,
input wire                              RegDstD,
input wire  [WIDTH-1:0]                 RD1_D, RD2_D,
input wire  [Rs_width-1:0]              RsD, 
input wire  [Rt_width-1:0]              RtD,
input wire  [Rd_width-1:0]              RdD,
input wire  [SignImm_width-1:0]         SignImmD,

output reg  [ALU_Control_width-1:0]     ALUControlE,
output reg                              RegWriteE, 
output reg                              MemtoRegE,
output reg                              MemWriteE,
output reg                              RegDstE,
output reg                              ALUSrcE,
output reg  [WIDTH-1:0]                 RD1_E, RD2_E,
output reg  [Rs_width-1:0]              RsE,
output reg  [Rt_width-1:0]              RtE,
output reg  [Rd_width-1:0]              RdE,
output reg  [SignImm_width-1:0]         SignImmE
);

reg [ALU_Control_width+5+2*WIDTH+Rs_width+Rt_width+Rd_width+SignImm_width-1:0]    OUT_s;
reg [ALU_Control_width+5+2*WIDTH+Rs_width+Rt_width+Rd_width+SignImm_width-1:0]    IN_s;

assign  {ALUControlE, RegWriteE, MemtoRegE, MemWriteE, RegDstE, ALUSrcE, RD1_E, RD2_E, RsE, RtE, RdE, SignImmE} = OUT_s ;
assign  {ALUControlD, RegWriteD, MemtoRegD, MemWriteD, RegDstD, ALUSrcD, RD1_D, RD2_D, RsD, RtD, RdD, SignImmD} = IN_s ;


always @(posedge CLK or negedge RST) begin
   if (!RST) begin
    OUT_s <= 'd0;
   end else if (CLR) begin
    OUT_s <= 'd0;
   end else if (!EN && CLR) begin
    OUT_s <= IN_s;
   end
end

    
endmodule