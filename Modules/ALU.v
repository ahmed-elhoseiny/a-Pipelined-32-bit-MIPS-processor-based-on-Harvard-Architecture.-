module ALU #(
parameter ALUResult_width = 32 ,
          ALU_Control_width = 3
) (
input	wire	[ALUResult_width-1:0]		        SrcA,
input	wire	[ALUResult_width-1:0]		        SrcB,
input	wire	[ALU_Control_width-1:0]			    ALUControl,

output	reg		[ALUResult_width-1:0]		        ALUResult
);

localparam [ALU_Control_width-1:0]      And = 'b000;
localparam [ALU_Control_width-1:0]      Or  = 'b001;
localparam [ALU_Control_width-1:0]      add = 'b010;
localparam [ALU_Control_width-1:0]      sub = 'b100;
localparam [ALU_Control_width-1:0]      mul = 'b101;
localparam [ALU_Control_width-1:0]      slt = 'b110;


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