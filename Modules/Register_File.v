module Register_File #(
parameter WIDTH =32,
          DEPTH =100, 
          REG_ADDR=5
) ( 
input	wire	[REG_ADDR-1:0]		A1,
input	wire	[REG_ADDR-1:0]		A2,
input	wire	[REG_ADDR-1:0]		A3,
input	wire						WE3,
input	wire	[WIDTH-1:0]			WD3,
input                               CLK,RST,
output  wire    [WIDTH-1:0]         RD1,RD2
);
    
reg     [WIDTH-1:0]     Reg_File    [0:DEPTH-1];

integer j;

always @(posedge CLK or negedge RST ) 
begin
    if (!RST) 
    begin
        for (j=0 ; j<=(DEPTH-1) ; j=j+1 ) 
        begin
            Reg_File[j] <= 'b0 ;
        end
    end else if (WE3) 
    begin
        Reg_File[A3] <= WD3 ;
    end
end

assign RD1 = Reg_File[A1] ;
assign RD2 = Reg_File[A2] ;

endmodule
