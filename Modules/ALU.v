module ALU #(
parameter WIDTH = 32
) (
input	wire	[WIDTH-1:0]		SrcA,
input	wire	[WIDTH-1:0]		SrcB,
input	wire	[2:0]			ALUControl,

output	reg		[WIDTH-1:0]		ALUResult,
output	wire					Zero
);

localparam [2:0] And = 3'b000;
localparam [2:0] Or  = 3'b001;
localparam [2:0] add = 3'b010;
localparam [2:0] sub = 3'b100;
localparam [2:0] mul = 3'b101;
localparam [2:0] slt = 3'b110;


always @(*)
begin
	case (ALUControl)
    And: begin
        ALUResult = SrcA & SrcB;
    end

    Or : begin
		ALUResult = SrcA | SrcB ;
    end

    add : begin
		ALUResult = SrcA + SrcB ;
	end

	sub : begin
		ALUResult = SrcA - SrcB ;
	end
		
    mul : begin
	    ALUResult = SrcA * SrcB ;
	end
		
	slt : begin
	    if (SrcA < SrcB) begin
            ALUResult = 'b1;
        end else begin
            ALUResult = 'b0;
        end
    end
		
	default : begin
		ALUResult = 'b0 ;
	end
	
	endcase
end

endmodule