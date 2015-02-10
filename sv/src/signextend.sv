//----------------------------------------
// File: signextend.sv
// Description: 16-bit to 32-bit sign extension
// Primary Author: Dominic Murphy
// Other Contributors: N/A
// Notes: - 
//----------------------------------------
module signextend(
        input        [15:0] In,
        output logic [31:0] Out
);

assign Out = {{16{In[15]}},In};

endmodule