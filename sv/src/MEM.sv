//----------------------------------------
// File: MEM.sv
// Description: Memory pipeline stage
// Primary Author: Dominic
// Other Contributors: N/A
// Notes: - The memory section of the pipeline will interface with
//          off chip memory. This is yet undetermined, hence memory
//          is currently bypassed.
//        - Bypass behaviour: MemDataIn = MemDataOut. MemAddr ignored.
//        - Assumed asynchronous for the time being.
//----------------------------------------
module MEM(
        input        [15:0] MemAddr, 
        input        [31:0] MemDataIn,
        output logic [31:0] MemDataOut
);

assign MemDataOut = MemDataIn;

endmodule