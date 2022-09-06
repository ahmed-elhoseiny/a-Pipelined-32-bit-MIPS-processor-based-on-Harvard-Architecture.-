module Instruction_Memory #(
parameter WIDTH = 32 , 
          DEPTH = 100
) (
input  wire     [WIDTH-1:0]		    A,
output reg      [WIDTH-1:0] 	    RD
);

reg [WIDTH-1:0] ROM [0:DEPTH-1];

always @(*) 
begin
    RD = ROM [A>>2];
end


initial 
begin
	$readmemh ("Program1.txt", ROM) ;  
end


endmodule