module Execute_to_Memory_Register #(
parameter   ALUOut_width = 32 ,
            WriteData_width = 32 ,
            WriteReg_width = 5
) (
input wire                                   CLK,
input wire                                   RST,
input wire                                   RegWriteE,
input wire                                   MemtoRegE,
input wire                                   MemWriteE,
input wire      [ALUOut_width-1:0]           ALUOutE,
input wire      [WriteData_width-1:0]        WriteDataE,
input wire      [WriteReg_width-1:0]         WriteRegE,

output reg                                   RegWriteM,
output reg                                   MemtoRegM,
output reg                                   MemWriteM,
output reg      [ALUOut_width-1:0]           ALUOutM,
output reg      [WriteData_width-1:0]        WriteDataM,
output reg      [WriteReg_width-1:0]         WriteRegM
);

reg  [3+ALUOut_width+WriteData_width+WriteReg_width-1:0]    OUT_s;
wire [3+ALUOut_width+WriteData_width+WriteReg_width-1:0]    IN_s;

assign  {RegWriteM, MemtoRegM, MemWriteM, ALUOutM, WriteDataM, WriteRegM} = OUT_s ;
assign  IN_s = {RegWriteE, MemtoRegE, MemWriteE, ALUOutE, WriteDataE, WriteRegE} ;

always @(posedge CLK or negedge RST) begin
   if (!RST) begin
    OUT_s <= 'd0;
   end else begin
    OUT_s <= IN_s;
   end
end


endmodule