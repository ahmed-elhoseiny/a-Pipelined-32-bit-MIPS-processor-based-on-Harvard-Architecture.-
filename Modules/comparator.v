module comparator #(
parameter  in1_width = 32 ,   
           in2_width =32
) (
input   wire  [31:0]  in1,in2,
output  wire          out_signal
);


assign out_signal = (in0 == in1) ? 1'b1 : 1'b0;

endmodule
