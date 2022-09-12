module Control_Unit #(
parameter   Funct_width = 6 ,
            Opcode_width = 6 ,  
            ALU_Control_width = 3 ,
            ALU_OP_width = 2
) (
input wire  [Opcode_width-1:0]      Opcode,
input wire  [Funct_width-1:0]       Funct,

output wire                         RegWrite,
output wire                         MemtoReg,
output wire                         MemWrite,
output wire [ALU_Control_width-1:0] ALUControl,
output wire                         ALUSrc,
output wire                         RegDst,
output wire                         Jump,
output wire                         Branch
);

wire       [ALU_OP_width-1:0]        ALUOp;

ALU_Decoder   ALU_Decoder_U1 (
.Funct(Funct),
.ALUOp(ALUOp),
.ALUControl(ALUControl)
);


Main_Decoder  Main_Decoder_U2 (
.Opcode(Opcode),    
.Jump(Jump),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.ALUOp(ALUOp)
);


endmodule
