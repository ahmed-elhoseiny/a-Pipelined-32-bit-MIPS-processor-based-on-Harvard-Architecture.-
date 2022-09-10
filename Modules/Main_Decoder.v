module Main_Decoder #(
parameter Opcode_width = 6 ,
          ALU_OP_width = 2   
) (
input   wire    [Opcode_width-1:0]    Opcode,

output  reg                           Jump, MemtoReg, MemWrite ,Branch ,ALUSrc ,RegDst ,RegWrite,
output  reg     [ALU_OP_width-1:0]    ALUOp
);

reg [7+ALU_OP_width-1:0] Enables_and_ALUOp;

localparam [Opcode_width-1:0]   loadWord      = 'b10_0011;
localparam [Opcode_width-1:0]   storeWord     = 'b10_1011;
localparam [Opcode_width-1:0]   rType         = 'b00_0000;
localparam [Opcode_width-1:0]   addImmediate  = 'b00_1000;
localparam [Opcode_width-1:0]   branchIfEqual = 'b00_0100;
localparam [Opcode_width-1:0]   jump_inst     = 'b00_0010;


assign {Jump, ALUOp, MemWrite, RegWrite, RegDst, ALUSrc, MemtoReg, Branch} = Enables_and_ALUOp;

always @(*) 
begin
    case (Opcode)
    loadWord:
    begin
        Enables_and_ALUOp = 'b000010110;
        /*
        Jump = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 1'b0;
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemtoReg = 1'b1;
        Branch = 1'b0;
        */
    end
        
    storeWord:
    begin
        Enables_and_ALUOp = 'b000100110;
        /*
        Jump = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 1'b1;
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemtoReg = 1'b1;
        Branch = 1'b0;
        */
    end

                 
    rType:  
    begin
        Enables_and_ALUOp = 'b010011000;
        /*
        Jump = 1'b0;
        ALUOp = 2'b10;
        MemWrite = 1'b0;
        RegWrite = 1'b1;
        RegDst = 1'b1;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        Branch = 1'b0;
        */
    end

        
    addImmediate:     
    begin
        Enables_and_ALUOp = 'b000010100;
        /*
        Jump = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 1'b0;
        RegWrite = 1'b1;
        RegDst = 1'b0;
        ALUSrc = 1'b1;
        MemtoReg = 1'b0;
        Branch = 1'b0;
        */
    end

         
    branchIfEqual:     
    begin
        Enables_and_ALUOp = 'b001000001;
        /*
        Jump = 1'b0;
        ALUOp = 2'b01;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        Branch = 1'b1;
        */
    end

        
    jump_inst:     
    begin
        Enables_and_ALUOp = 'b100000000;
        /*
        Jump = 1'b1;
        ALUOp = 2'b00;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        Branch = 1'b0;
        */
    end

    default:           
    begin
        Enables_and_ALUOp = 'b000000000;
        /*
        Jump = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 1'b0;
        RegWrite = 1'b0;
        RegDst = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        Branch = 1'b0;
        */
    end
endcase
end

endmodule
