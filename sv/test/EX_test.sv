module EX_test_3(
);

timeunit 1ns; timeprecision 100ps;
const int clk  = 100;
const int c3_4 = 75;
const int c1_4 = 25;

logic        Clock      ,
             nReset     ,
             ALUOp      ,
             MULOp      ,
             Jump       ,
             Branch     ,
             RegWriteIn ,
             MemReadIn  ,
             MemtoRegIn ,
             MemWriteIn ,
             ALUSrc     ,
             BRASrc     ;
logic [31:0] A          , 
             B          , 
             Immediate  , 
             PCin       ; 
logic [ 4:0] Shamt      ; 
logic [ 4:0] RAddrIn    ;
logic [ 5:0] Func       ;
logic [ 2:0] MemfuncIn  ;
logic [31:0] Out        ,
             RtDataOut  ,
             PCout      ;  
logic [ 4:0] RAddrOut   ;
logic [ 2:0] MemfuncOut ;
logic        C          , 
             Z          , 
             O          , 
             N          , 
             RegWriteOut,
             MemReadOut ,
             MemtoRegOut,
             MemWriteOut,
             BranchTaken;
    
EX ex0 (.*);

always
    begin
        #(clk/2) Clock = 1;
        #(clk/2) Clock = 0;
    end

initial
    begin
                nReset     = 0;
                ALUOp      = 0;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h0;
                PCin       = 32'h0;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h0;
                MemfuncIn  = 3'h0;
        
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h0;
                PCin       = 32'h0;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h0;
                MemfuncIn  = 3'h0;
        
        #clk   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 1;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h12340000;
                Immediate  = 32'h12340000;
                PCin       = 32'h4;
                Shamt      = 5'h8;
                RAddrIn    = 5'h1;
                Func       = 6'h20;
                MemfuncIn  = 3'h0;
//1                
        #c1_4    assert(
                (Out         == 32'h12340000 ) &&
                (RtDataOut   == 32'h12340000 ) &&
                (PCout       == 32'h4        ) &&
                (RAddrOut    == 5'h1         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 1;
                BRASrc     = 0;
                A          = 32'h12340000;
                B          = 32'h12340000;
                Immediate  = 32'h5678;
                PCin       = 32'h8;
                Shamt      = 5'h19;
                RAddrIn    = 5'h1;
                Func       = 6'h25;
                MemfuncIn  = 3'h0;
//2                
        #c1_4    assert(
                (Out         == 32'h12345678) &&
                (RtDataOut   == 32'h12340000) &&
                (PCout       == 32'h8        ) &&
                (RAddrOut    == 5'h1         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 1;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h01230000;
                PCin       = 32'hC;
                Shamt      = 5'h4;
                RAddrIn    = 5'h2;
                Func       = 6'h20;
                MemfuncIn  = 3'h0;
//3                
        #c1_4    assert(
                (Out         == 32'h01230000 ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'hC        ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 1;
                BRASrc     = 0;
                A          = 32'h01230000;
                B          = 32'h01230000;
                Immediate  = 32'h00004567;
                PCin       = 32'h10;
                Shamt      = 5'h15;
                RAddrIn    = 5'h2;
                Func       = 6'h25;
                MemfuncIn  = 3'h0;
//4        
        #c1_4    assert(
                (Out         == 32'h01234567 ) &&
                (RtDataOut   == 32'h01230000 ) &&
                (PCout       == 32'h10       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 1;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h01234567;
                Immediate  = 32'h1802;
                PCin       = 32'h14;
                Shamt      = 5'h0;
                RAddrIn    = 5'h3;
                Func       = 6'h2;
                MemfuncIn  = 3'h0;
//5                
        #c1_4    assert(
                (Out         == 32'hB8C52248 ) &&
                (RtDataOut   == 32'h01234567 ) &&
                (PCout       == 32'h14       ) &&
                (RAddrOut    == 5'h3         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h0;
                Immediate  = 32'h11;
                PCin       = 32'h18;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h11;
                MemfuncIn  = 3'h0;
//6                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h18       ) &&
                (RAddrOut    == 5'h0         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h0;
                Immediate  = 32'h13;
                PCin       = 32'h1C;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h13;
                MemfuncIn  = 3'h0;
//7                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h1C       ) &&
                (RAddrOut    == 5'h0         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);

        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h1234567;
                Immediate  = 32'h18;
                PCin       = 32'h20;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h18;
                MemfuncIn  = 3'h0;
//8                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567 ) &&
                (PCout       == 32'h20       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h2010;
                PCin       = 32'h24;
                Shamt      = 5'h0;
                RAddrIn    = 5'h4;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//9                
        #c1_4    assert(
                (Out         == 32'h14B66D  ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h24       ) &&
                (RAddrOut    == 5'h4         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h2812;
                PCin       = 32'h28;
                Shamt      = 5'h0;
                RAddrIn    = 5'h5;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//10                
        #c1_4    assert(
                (Out         == 32'hB8C52248) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h28       ) &&
                (RAddrOut    == 5'h5         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 1;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h1234567;
                Immediate  = 32'h0;
                PCin       = 32'h2C;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h0;
                MemfuncIn  = 3'h0;
//11                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567 ) &&
                (PCout       == 32'h2C       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h3010;
                PCin       = 32'h30;
                Shamt      = 5'h0;
                RAddrIn    = 5'h6;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//12                
        #c1_4    assert(
                (Out         == 32'h296CDB  ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h30       ) &&
                (RAddrOut    == 5'h6         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h3812;
                PCin       = 32'h34;
                Shamt      = 5'h0;
                RAddrIn    = 5'h7;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//13                
        #c1_4    assert(
                (Out         == 32'h718A4490) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h34       ) &&
                (RAddrOut    == 5'h7         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 1;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h1234567;
                B          = 32'h1234567;
                Immediate  = 32'h4;
                PCin       = 32'h38;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h4;
                MemfuncIn  = 3'h0;
//14                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567  ) &&
                (PCout       == 32'h38       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h4010;
                PCin       = 32'h3C;
                Shamt      = 5'h0;
                RAddrIn    = 5'h8;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//15                
        #c1_4    assert(
                (Out         == 32'h282174   ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h3C       ) &&
                (RAddrOut    == 5'h8         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h4812;
                PCin       = 32'h40;
                Shamt      = 5'h0;
                RAddrIn    = 5'h9;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//16                
        #c1_4    assert(
                (Out         == 32'h968F951F) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h40       ) &&
                (RAddrOut    == 5'h9         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 1;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h1234567;
                B          = 32'h1234567;
                Immediate  = 32'h1;
                PCin       = 32'h44;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h1;
                MemfuncIn  = 3'h0;
//17                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567 ) &&
                (PCout       == 32'h44       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h5010;
                PCin       = 32'h48;
                Shamt      = 5'h0;
                RAddrIn    = 5'hA;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//18                
        #c1_4    assert(
                (Out         == 32'h296CDB  ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h48       ) &&
                (RAddrOut    == 5'hA        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h5812;
                PCin       = 32'h4C;
                Shamt      = 5'h0;
                RAddrIn    = 5'hB;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//19                
        #c1_4    assert(
                (Out         == 32'h718A4490) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h4C       ) &&
                (RAddrOut    == 5'hB        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 0;
                MULOp      = 1;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h1234567;
                B          = 32'h1234567;
                Immediate  = 32'h5;
                PCin       = 32'h50;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h5;
                MemfuncIn  = 3'h0;
//20                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567 ) &&
                (PCout       == 32'h50       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h6010;
                PCin       = 32'h54;
                Shamt      = 5'h0;
                RAddrIn    = 5'hC;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//21                
        #c1_4    assert(
                (Out         == 32'h282174  ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h54       ) &&
                (RAddrOut    == 5'hC        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h6812;
                PCin       = 32'h58;
                Shamt      = 5'h0;
                RAddrIn    = 5'hD;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//22                
        #c1_4    assert(
                (Out         == 32'h968F951F) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h58       ) &&
                (RAddrOut    == 5'hD        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h1234567;
                Immediate  = 32'h19;
                PCin       = 32'h5C;
                Shamt      = 5'h0;
                RAddrIn    = 5'h2;
                Func       = 6'h19;
                MemfuncIn  = 3'h0;
//23                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h1234567 ) &&
                (PCout       == 32'h5C       ) &&
                (RAddrOut    == 5'h2         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h7010;
                PCin       = 32'h60;
                Shamt      = 5'h0;
                RAddrIn    = 5'hE;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//24                
        #c1_4    assert(
                (Out         == 32'h14B66D  ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h60       ) &&
                (RAddrOut    == 5'hE        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'h7812;
                PCin       = 32'h64;
                Shamt      = 5'h0;
                RAddrIn    = 5'hF;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//25                
        #c1_4    assert(
                (Out         == 32'hB8C52248) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h64      ) &&
                (RAddrOut    == 5'hF        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h12345678;
                B          = 32'h0;
                Immediate  = 32'h11;
                PCin       = 32'h68;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h11;
                MemfuncIn  = 3'h0;
//26                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h68      ) &&
                (RAddrOut    == 5'h0         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 0;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h1234567;
                B          = 32'h0;
                Immediate  = 32'h13;
                PCin       = 32'h6C;
                Shamt      = 5'h0;
                RAddrIn    = 5'h0;
                Func       = 6'h13;
                MemfuncIn  = 3'h0;
//27                
        #c1_4    assert(
                (Out         == 32'h0        ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h6C      ) &&
                (RAddrOut    == 5'h0         ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'hFFFF8010;
                PCin       = 32'h70;
                Shamt      = 5'h0;
                RAddrIn    = 5'h10;
                Func       = 6'h10;
                MemfuncIn  = 3'h0;
//28                
        #c1_4    assert(
                (Out         == 32'h12345678) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h70      ) &&
                (RAddrOut    == 5'h10        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #c3_4   nReset     = 1;
                ALUOp      = 1;
                MULOp      = 0;
                Jump       = 0;
                Branch     = 0;
                RegWriteIn = 1;
                MemReadIn  = 0;
                MemtoRegIn = 0;
                MemWriteIn = 0;
                ALUSrc     = 0;
                BRASrc     = 0;
                A          = 32'h0;
                B          = 32'h0;
                Immediate  = 32'hFFFF8812;
                PCin       = 32'h74;
                Shamt      = 5'h0;
                RAddrIn    = 5'h11;
                Func       = 6'h12;
                MemfuncIn  = 3'h0;
//29                
        #c1_4    assert(
                (Out         == 32'h1234567 ) &&
                (RtDataOut   == 32'h0        ) &&
                (PCout       == 32'h74      ) &&
                (RAddrOut    == 5'h11        ) &&
                (MemfuncOut  == 3'h0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);

    $finish;
    end
                 
endmodule
