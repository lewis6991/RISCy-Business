//----------------------------------------
// File: EX.sv
// Description: Execute stage logic
// Primary Author: Ethan Bishop
// Other Contributors: 
//----------------------------------------

module EX(
    input        [31:0] A  ,
    input        [31:0] B  ,
    input        [4:0]  Shamt,
    input        [5:0]  AluFunc,
    input        [5:0]  MultFunc,
    input               MultSel, OutSel
    output logic [31:0] Out,
    output logic        C, Z, O, N,
                        LoadReg
);

