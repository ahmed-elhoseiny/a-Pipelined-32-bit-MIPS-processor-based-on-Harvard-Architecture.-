module ALU_Decoder #(
parameter Funct_width = 6 ,
          ALU_OP_width = 2 ,  
          ALU_Control_width = 3
) (
input   wire     [Funct_width-1:0]          Funct,
input   wire     [ALU_OP_width-1:0]         ALUOp,

output  reg      [ALU_Control_width-1:0]    ALUControl
);
    
localparam [Funct_width-1:0]        add = 'b10_0000;
localparam [Funct_width-1:0]        sub = 'b10_0010;
localparam [Funct_width-1:0]        slt = 'b10_1010;
localparam [Funct_width-1:0]        mul = 'b01_1100;
//localparam [Funct_width-1:0]        And = 'b10_0100;
//localparam [Funct_width-1:0]        OR  = 'b10_0101;

always @(*) 
begin
    case (ALUOp)
        2'b00:
        begin
            ALUControl = 'b010; 
        end

        2'b01:
        begin
            ALUControl = 'b100;
        end

        2'b10:
        begin
            case (Funct)
                add:    
                begin
                    ALUControl = 3'b010;
                end

                sub:    
                begin
                    ALUControl = 3'b100;
                end

                slt:    
                begin
                    ALUControl = 3'b110;
                end

                mul:    
                begin
                    ALUControl = 3'b101;
                end

                default: 
                begin
                    ALUControl = 3'b010;
                end
            endcase
        end

        2'b11 : 	
	    begin
		    ALUControl = 3'b010 ;
	    end

        default: 
        begin
            ALUControl = 3'b010;
        end 
    endcase

end 


endmodule
