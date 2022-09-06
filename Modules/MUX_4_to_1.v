module MUX_4_to_1 #(
parameter IN_WIDTH  =32,
          OUT_WIDTH =32, 
          sel_WIDTH =2 
) (
input        wire       [IN_WIDTH-1:0]   In1,
input        wire       [IN_WIDTH-1:0]   In2,
input        wire       [IN_WIDTH-1:0]   In3,
input        wire       [IN_WIDTH-1:0]   In4,
input        wire                        sel,

output       reg       [OUT_WIDT-1:0]    out
);


always @(*) 
begin
    case (sel)
       2'b00: out = In1;
       2'b01: out = In2;
       2'b10: out = In3;
       2'b11: out = In4;
    endcase
end
endmodule