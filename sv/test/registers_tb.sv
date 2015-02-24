//----------------------------------------
// File: registers_tb.sv
// Description: Register testbench
// Primary Author: Jack Barnes
// Other Contributors:
// Notes: Full test coverage
//----------------------------------------
module registers_tb;

timeunit 10ns; timeprecision 100ps;
const int clk = 100;

logic Clock, nReset, RegWrite;
logic [4:0] RdAddr, RsAddr, RtAddr;
logic [31:0] RdData;
wire  [31:0] RsData, RtData;

registers registers0 (
    .Clock    (Clock   ), 
    .nReset   (nReset  ),
    .RegWrite (RegWrite),
    .RdAddr   (RdAddr  ),
    .RsAddr   (RsAddr  ),
    .RtAddr   (RtAddr  ),
    .RdData   (RdData  ),
    .RsData   (RsData  ),
    .RtData   (RtData  )
);

//Initial conditions
initial
begin
    Clock    = 1'b0;
    nReset   = 1'b0;
    RegWrite = 1'b0;
    RdAddr   = 0;
    RsAddr   = 0;
    RtAddr   = 0;
    RdData   = 0;
end

//Clock implementation
always
    #(clk/2) Clock = !Clock;

//Testing procedure
initial
begin
    for (int h = 0 ; h < 2; h++)
    begin
        #clk
        nReset = 0;
        //Test nReset condition
        RdData = 9673;
        RegWrite = h;
        for (int i = 0 ; i < 32; i++)
        begin
            RdAddr = i;
            for (int j = 0 ; j < 32; j++)
            begin
                RsAddr = j;
                RtAddr = j;
                #clk
                assert (RsData[j] == 0) 
                else
                    $error("ERROR: nReset active, RsAddr = %b, RsData = %b\n", RsAddr, RsData);
                assert (RtData[j] == 0) 
                else
                    $error("ERROR: nReset active, RtAddr = %b,  RtData = %b\n", RtAddr, RtData);
            end
        end
    
        nReset = 1;
        //Test PC implementation
        for (int i = 0 ; i < 32; i++)
        begin
            RdData = i * 32;
            RdAddr = i;
            RsAddr = i;
            RtAddr = i;
            #clk
            assert ((RsData[i] == RdData[i]) || ~RegWrite)
            else
                $error("ERROR: RsAddr = %b, RsData = %b, RdData = %b\n", RsAddr, RsData, RdData);
            assert ((RtData[i] == RdData[i]) || ~RegWrite) 
            else
                $error("ERROR: RtAddr = %b, RtData = %b, RdData = %b\n", RtAddr, RtData, RdData);
        end
    end
    $finish;
end

endmodule
