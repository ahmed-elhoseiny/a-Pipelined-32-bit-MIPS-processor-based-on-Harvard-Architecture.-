module MUX_2_to_1 #(parameter WIDTH =32) (
input        wire       [WIDTH-1:0]      In1,
input        wire       [WIDTH-1:0]      In2,
input        wire                        sel,

output       wire       [WIDTH-1:0]      out
);


assign out = (sel==1'b0) ? In1 : In2 ;

//always @(*) 
//begin
//    case (sel)
//       1'b0: out = In1;
//       1'b1: out = In2;
//    endcase
//end
endmodule