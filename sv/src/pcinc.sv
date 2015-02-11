//------------------------------------------------------------------------------
// File              : pcinc.sv
// Description       : Adds 4 to the input. Used for PC incrementation.
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : Out = In + 4.
//------------------------------------------------------------------------------

module pcinc(
    input        [31:0] In ,
    output logic [31:0] Out
);


always_comb
begin
    Out = In + 32'd4;

    assert(Out > In)
    else
    begin
        //Test after time = 0
        if ((Out !== 32'dx) && (Out !== 32'dx))
            $error("%dns: add4 has overflowed.", $time);
    end
end

endmodule
