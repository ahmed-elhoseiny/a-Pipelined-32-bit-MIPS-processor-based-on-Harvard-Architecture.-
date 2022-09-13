module OR_gate (
input        wire             In1,
input        wire             In2,

output       wire             out
);

assign out = In1 | In2 ;

endmodule