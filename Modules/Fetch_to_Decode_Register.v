module Fetch_to_Decode_Register #(
parameter Instr_width = 32;
          PCPlus4_width = 32;
) (
input wire      [Instr_width-1:0]         InstrF;
input wire      [PCPlus4_width-1:0]       PCPlus4F;

output reg      [Instr_width-1:0]         InstrD;
output reg      [PCPlus4_width-1:0]       PCPlus4D;

);
    
endmodule