module shift_left_twice #(
parameter IN_width  =32,
          OUT_width =32
) (
input        wire       [IN_width-1:0]      IN,
output       wire       [OUT_width-1:0]     OUT
);

assign OUT = (IN << 2);

endmodule