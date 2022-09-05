module Adder #(parameter WIDTH =32) (
input        wire       [WIDTH-1:0]      IN_1,
input        wire       [WIDTH-1:0]      IN_2,

output       wire       [WIDTH-1:0]      OUT
);

assign OUT = IN_1 + IN_2;

endmodule