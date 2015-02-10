//------------------------------------------------------------------------------
// File              : nleftshift.sv
// Description       : n-bit fixed left shift (32-bit)
// Primary Author    : Dominic Murphy
// Other Contributors: Lewis Russell
// Notes             : - parameter n determines amount of shift.
//------------------------------------------------------------------------------

module nshift #(parameter n = 2)(
        input        [31:0] In ,
        output logic [31:0] Out
);

    assign Out = {In[31-n:0], {n{1'b0}}};

endmodule
