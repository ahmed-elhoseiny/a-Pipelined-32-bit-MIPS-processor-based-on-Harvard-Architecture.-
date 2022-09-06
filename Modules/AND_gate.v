module AND_gate #(parameter WIDTH =32) (
input        wire       [WIDTH-1:0]      In1,
input        wire       [WIDTH-1:0]      In2,

output       wire       [WIDTH-1:0]      out
);

assign out = In1 & In2 ;

endmodule