module Pipelined_MIPS_TOP_MODULE #(
parameter Test_Value_width = 16,
) (
input wire                                    CLK, RST,
output wire      [Test_Value_width-1:0]       Test_Value_M   
);
    

Hazard_Unit #(
                .Rs_width(),
                .Rt_width() ,
                .WriteReg_width(),
                .ForwardAE_width(),
                .ForwardBE_width()
             )      Hazard_Unit_U1
(
.BranchD(),
.JumpD(),
.RsD(),
.RtD(),
.RsE(),
.RtE(),
.WriteRegE(),
.RegWriteE(),
.RegWriteM(),
.WriteRegM(),
.RegWriteW(),
.WriteRegW(),
.MemtoRegE(),

.ForwardAE(),
.ForwardBE(),
.FlushE(),
.ForwardAD(),
.ForwardBD(),
.StallF(),
.StallD()
);


Fetch_stage #(
                .PCPlus4_width(),
                .PCSrcD_width(),
                .Instr_width(),
                .PCBranch_width(),
                .PCJump_width(),
                .PC_in_width(),
                .PCF_width()
             )         Fetch_stage_U1
(
.CLK(),
.RST(),
.PCSrcD(),
.PCBranchD(),
.PCJump(),
.StallF(),

.PCPlus4F(),    
.InstrF() 
);


Fetch_to_Decode_Register #(
                            .Instr_width(),
                            .PCPlus4_width()
                          )   Fetch_to_Decode_Register_U1
(
.CLK(),
.RST(),
.CLR(),
.EN(),
.InstrF(),
.PCPlus4F(),

.InstrD(),
.PCPlus4D()
);


Decode_stage #(
                .Instr_width(),
                .PCPlus4_width(),
                .PCBranch_width(),
                .WriteReg_width(),
                .Result_width(),
                .ALU_Control_width(),
                .PCSrcD_width(),
                .ALUOut_width(),
                .WIDTH(),
                .Rs_width(),
                .Rt_width(),
                .Rd_width(),
                .SignImm_width(),
                .shifted_SignImmD_width(),
                .shifted_Instr_0to25_width()
              )      Decode_stage_U1
(
.CLK(), 
.RST(),
.InstrD(), 
.PCPlus4D(),
.WriteRegW(),
.RegWriteW(),
.ForwardAD(),
.ForwardBD(),
.ResultW(),
.ALUOutM(),

.RegWriteD(),
.MemtoRegD(),
.MemWriteD(),
.ALUControlD(),
.ALUSrcD(),
.RegDstD(),
.JumpD(),
.BranchD(),
.PCSrcD(),
.OR_PCSrcD_0or1(),
.PCBranchD(),
.RD1_D(), 
.RD2_D(),
.RsD(),
.RtD(),
.RdD(),
.SignImmD(),
.PCJumpD()
);



Decode_to_Execute_Register #(
                                .ALU_Control_width(),
                                .Rs_width(),
                                .Rt_width(),
                                .Rd_width(),
                                .WIDTH(),
                                .SignImm_width()
                            )  Decode_to_Execute_Register_U1
(
.CLK(), 
.RST(), 
.CLR(),
.MemWriteD(),
.MemtoRegD(),
.ALUControlD(),
.ALUSrcD(),
.RegWriteD(),
.RegDstD(),
.RD1_D(), 
.RD2_D(),
.RsD(), 
.RtD(),
.RdD(),
.SignImmD(),

.ALUControlE(),
.RegWriteE(), 
.MemtoRegE(),
.MemWriteE(),
.RegDstE(),
.ALUSrcE(),
.RD1_E(), 
.RD2_E(),
.RsE(),
.RtE(),
.RdE(),
.SignImmE()
);


Execute_stage  #(
                    .ALU_Control_width(),
                    .WIDTH(),
                    .Rs_width(),
                    .Rt_width(),
                    .Rd_width(),
                    .SignImm_width(),
                    .Result_width(),
                    .ALUOut_width(),
                    .ForwardAE_width(),
                    .ForwardBE_width(),
                    .WriteData_width(),
                    .WriteReg_width(),
                )   Execute_stage_U1
(
.ALUControlE(),
.RegWriteE(),
.MemtoRegE(),
.MemWriteE(),
.RegDstE(),
.ALUSrcE(),
.RD1_E(),
.RD2_E(),
.RsE(),
.RdE(),
.RtE(),
.SignImmE(),
.ResultW(),
.ALUOutM(),
.ForwardAE(),
.ForwardBE(),

.RegWriteE(),
.MemtoRegE(),
.MemWriteE(),
.ALUOutE(),
.WriteDataE(),
.WriteRegE()
);



Execute_to_Memory_Register #(
                                .ALUOut_width(),
                                .WriteData_width(),
                                .WriteReg_width()
                            )    Execute_to_Memory_Register_U1   
(
.CLK(),
.RST(),
.RegWriteE(),
.MemtoRegE(),
.MemWriteE(),
.ALUOutE(),
.WriteDataE(),
.WriteRegE(),

.RegWriteM(),
.MemtoRegM(),
.MemWriteM(),
.ALUOutM(),
.WriteDataM(),
.WriteRegM()
);



Memory_stage #(
                .ALUOut_width(),
                .WriteData_width(),
                .WriteReg_width(),
                .ReadDat_width(),
                .Test_Value_width()
              )   Memory_stage_U1
(
.RegWriteM(),
.MemtoRegM(),
.MemWriteM(),
.CLK(), 
.RST(),
.ALUOutM(),
.WriteDataM(),
.WriteRegM(),

.RegWriteM(),
.MemtoRegM(),
.MemWriteM(),
.ReadDataM(),
.ALUOutM(),
.WriteRegM(),
.Test_Value_M()
);


Memory_to_Writeback_Register #(
                                .ReadDat_width(),
                                .ALUOut_width(),
                                .WriteReg_width()
                              )   Memory_to_Writeback_Register_U1
(
.CLK(),
.RST(),
.RegWriteM(),
.MemtoRegM(),
.ReadDataM(),
.ALUOutM(),
.WriteRegM(),

.RegWriteW(),
.MemtoRegW(),
.ReadDataW(),
.ALUOutW(),
.WriteRegW()
);



Writeback_stage #(
                    .ReadDat_width(),
                    .ALUOut_width(),
                    .WriteReg_width(),
                    .Result_width()
                 )   Writeback_stage_U1
(
.RegWriteW(),
.MemtoRegW(),
.ALUOutW(),
.ReadDataW(),
.WriteRegW(),

.WriteRegW(),
.ResultW(),
.RegWriteW()
);


endmodule