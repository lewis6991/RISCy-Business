//------------------------------------------------------------------------------
// File              : MEM.sv
// Description       : Memory pipeline stage
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell, Dhanushan Raveendran
// Notes             : - The memory section of the pipeline will interface with
//                       off chip memory. This is yet undetermined, hence memory
//                       is currently bypassed.
//                     - Bypass behaviour: MemDataIn = MemDataOut. MemAddr
//                       ignored.
//                     - Assumed asynchronous for the time being.
//------------------------------------------------------------------------------

`include "mem_func.sv"

module MEM(
    input               Clock       ,
                        nReset      ,
                        ALUC        ,
                        ALUZ        ,
                        ALUO        ,
                        ALUN        ,
                        ACCEn       ,
                        MULOp       ,
    input        [31:0] ALUIn       , // Input from ALU
    input        [63:0] MULIn       , // Input from MUL
    input        [ 5:0] Func        ,
    input        [ 2:0] MemfuncIn   ,
    input        [31:0] RtDataIn    ,
    output logic        WriteL      ,
                        WriteR      ,
                        C           , // Carry out flag.
                        Z           , // Output zero flag.
                        O           , // Overflow flag.
                        N           ,  // Output negative flag.
    output logic [31:0] MemWriteData,
                        Out         
);

    wire [31:0] ACCout;
    wire [63:0] in;

    wire ACCO;
    wire ACCZ;
    wire ACCN;
    wire ACCC;

    assign in = MULOp ? MULIn : ALUIn;

    acc_control acc_control0 (
        .Clock   (Clock ),
        .nReset  (nReset),
        .ACCEn   (ACCEn ),
        .MULfunc (Func  ),
        .In      (in    ),
        .Out     (ACCout),
        .C       (ACCC  ), // Carry flag.
        .Z       (ACCZ  ), // Zero flag.
        .O       (ACCO  ), // Overflow flag.
        .N       (ACCN  )  // Negative flag.
    );

    assign Out = ACCEn ? ACCout : in[31:0];

    assign C = ACCEn ? ACCC : ALUC;
    assign Z = ACCEn ? ACCZ : ALUZ;
    assign O = ACCEn ? ACCO : ALUO;
    assign N = ACCEn ? ACCN : ALUN;

    always_comb
    begin
        WriteL = MemfuncIn == `WL;
        WriteR = MemfuncIn == `WR;
        case(MemfuncIn)
            `BS          : MemWriteData = $signed(RtDataIn[ 7:0]);
            `HS          : MemWriteData = $signed(RtDataIn[15:0]);
            `WD, `WL, `WR: MemWriteData = RtDataIn;
            default      : MemWriteData = RtDataIn;
        endcase
    end

endmodule
