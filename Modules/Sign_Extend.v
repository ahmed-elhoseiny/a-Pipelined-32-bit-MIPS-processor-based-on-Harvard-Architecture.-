module Sign_Extend #(
parameter Extend_width = 32, 
          Imm_width = 16
) (
input    wire     [Imm_width-1:0]           Imm,
output   reg      [Extend_width-1:0]        SignImm
);

always @(*) 
begin
    if (Imm[Imm_width-1] == 1'b1) 
    begin
        SignImm = {{(Extend_width-Imm_width){1'b1}},Imm};
    end else 
    begin
        SignImm = {{(Extend_width-Imm_width){1'b0}},Imm};
    end
end 
endmodule