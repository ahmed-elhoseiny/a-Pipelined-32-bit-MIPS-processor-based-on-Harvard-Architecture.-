module Instruction_Memory #(
parameter WIDTH = 32 , 
          DEPTH = 100
) (
input  wire     [WIDTH-1:0]		    A,
output wire      [WIDTH-1:0] 	    RD
);

reg [WIDTH-1:0] ROM [0:DEPTH-1];

assign  RD = ROM [A>>2];

initial 
begin
	$readmemh ("Program1.txt", ROM) ;  
end


endmodule