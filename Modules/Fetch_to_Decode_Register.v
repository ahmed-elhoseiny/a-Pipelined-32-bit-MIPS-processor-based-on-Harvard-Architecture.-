module Fetch_to_Decode_Register #(
parameter Instr_width = 32 ,
          PCPlus4_width = 32
) (
input wire                                CLK;
input wire                                RST;
input wire                                CLR;
input wire                                EN;
input wire      [Instr_width-1:0]         InstrF;
input wire      [PCPlus4_width-1:0]       PCPlus4F;

output reg      [Instr_width-1:0]         InstrD;
output reg      [PCPlus4_width-1:0]       PCPlus4D;
);

always @(posedge CLK or negedge RST) begin
   if (!RST) begin
    InstrD <= 'b0;
    PCPlus4D <= 'b0;
   end else if (!EN && !CLR) begin
    InstrD <= InstrF;
    PCPlus4D <= PCPlus4F;
   end else if (!EN && CLR) begin
    InstrD <= 'b0;
    PCPlus4D <= 'b0;
   end
end

endmodule