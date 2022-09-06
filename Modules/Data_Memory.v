module Data_Memory #(
parameter WIDTH =32 ,
          DEPTH =100 ,
          Test_Value_width =16 ,
) (
input     wire  [WIDTH-1:0]            A,
input     wire  [WIDTH-1:0]            WD,
input     wire                         WE,
input     wire                         CLK,RST,

output    wire  [WIDTH-1:0]            RD,
output    reg   [Test_Value_width-1:0] Test_Value
);
    
reg		[WIDTH-1:0] 	RAM		[0:DEPTH-1] ;
reg     [WIDTH-1:0]     ADDR_0 ;

integer k ;

always @(posedge CLK or negedge RST) 
begin
    if (!RST) 
    begin
        for ( k=0 ; k<=(DEPTH-1) ; k=k+1) 
        begin
            RAM[k] <= 'b0;
        end
    end else if (WE) 
    begin
        RAM[A] <= WD;
    end 
end

assign Test_Value = RAM[32'd0][Test_Value_width-1:0];
assign RD = RAM[A];

endmodule

