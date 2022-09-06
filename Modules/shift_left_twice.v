module shift_left_twice #(parameter WIDTH =32) (
input        wire       [WIDTH-1:0]      IN,
output       wire       [WIDTH-1:0]      OUT
);

assign OUT = (IN << 2);

endmodule