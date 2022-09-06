module Program_Counter #(
parameter PC_in_width = 32,
          PC_out_width = 32
) (
input   wire                              CLK,
input   wire                              RST,
input   wire                              EN,
input	wire	[PC_in_width-1:0]		  PC_in,

output  reg     [PC_out_width-1:0]		  PC_out
);

always @(posedge CLK or negedge RST) 
begin
  if (!RST) 
  begin
    PC_out <= 'b0;
  end else if (!EN) begin
     PC_out <= PC_in;
  end 
end

endmodule
