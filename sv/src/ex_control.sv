//------------------------------------------------------------------------------
// File              : ex_control.sv
// Description       : Execute stage control logic
// Primary Author    : Ethan Bishop
// Other Contributors:
// Notes             : Controls the ALU, MUL, ACC and (eventually) BRANCH
//                     modules
//------------------------------------------------------------------------------
module ex_control(
    input         Branch     ,
                  RegWriteIn ,
                  BRAtaken   ,
    output logic  RegWriteOut
);

    always_comb
        if (Branch)
            RegWriteOut = RegWriteIn & BRAtaken;
        else
            RegWriteOut = RegWriteIn;

endmodule
