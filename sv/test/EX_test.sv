module EX_test_3(
);

timeunit 10ns; timeprecision 100ps;

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
        #10ns Clock = 1;
        #10ns Clock = 0;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd0;
                PCin       = 32'd0;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd0;
                MemfuncIn  = 3'd0;
        
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd0;
                PCin       = 32'd0;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd0;
                MemfuncIn  = 3'd0;
        
        #20ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd305397760;
                Immediate  = 32'd305397760;
                PCin       = 32'd4;
                Shamt      = 5'd8;
                RAddrIn    = 5'd1;
                Func       = 6'd32;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd305397760) &&
                (RtDataOut   == 32'd305397760) &&
                (PCout       == 32'd4        ) &&
                (RAddrOut    == 5'd1         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd305397760;
                B          = 32'd305397760;
                Immediate  = 32'd22136;
                PCin       = 32'd8;
                Shamt      = 5'd25;
                RAddrIn    = 5'd1;
                Func       = 6'd37;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd305419896) &&
                (RtDataOut   == 32'd305397760) &&
                (PCout       == 32'd8        ) &&
                (RAddrOut    == 5'd1         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd19070976;
                PCin       = 32'd12;
                Shamt      = 5'd4;
                RAddrIn    = 5'd2;
                Func       = 6'd32;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd19070976 ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd12       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd305419896;
                B          = 32'd19088743;
                Immediate  = 32'd6146;
                PCin       = 32'd20;
                Shamt      = 5'd0;
                RAddrIn    = 5'd3;
                Func       = 6'd2;
                MemfuncIn  = 3'd0;
        
        #5ns    assert(
                (Out         == 32'd19088743 ) &&
                (RtDataOut   == 32'd19070976 ) &&
                (PCout       == 32'd16       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #15ns   nReset     = 1;
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
                A          = 32'd305419896;
                B          = 32'd19088743;
                Immediate  = 32'd6146;
                PCin       = 32'd20;
                Shamt      = 5'd0;
                RAddrIn    = 5'd3;
                Func       = 6'd2;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd3099927112) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd20       ) &&
                (RAddrOut    == 5'd3         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #15ns   nReset     = 1;
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
                A          = 32'd205419896;
                B          = 32'd0;
                Immediate  = 32'd17;
                PCin       = 32'd24;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd17;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd24       ) &&
                (RAddrOut    == 5'd0         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd205419896;
                B          = 32'd0;
                Immediate  = 32'd19;
                PCin       = 32'd28;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd19;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd28       ) &&
                (RAddrOut    == 5'd0         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);

        #15ns   nReset     = 1;
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
                A          = 32'd205419896;
                B          = 32'd19088743;
                Immediate  = 32'd24;
                PCin       = 32'd32;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd24;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd32       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
        
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd8208;
                PCin       = 32'd36;
                Shamt      = 5'd0;
                RAddrIn    = 5'd4;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd1357421  ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd36       ) &&
                (RAddrOut    == 5'd4         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd10258;
                PCin       = 32'd40;
                Shamt      = 5'd0;
                RAddrIn    = 5'd5;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd3099927112) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd40       ) &&
                (RAddrOut    == 5'd5         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd305419896;
                B          = 32'd19088743;
                Immediate  = 32'd0;
                PCin       = 32'd44;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd0;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd44       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd12304;
                PCin       = 32'd48;
                Shamt      = 5'd0;
                RAddrIn    = 5'd6;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2714843  ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd48       ) &&
                (RAddrOut    == 5'd6         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd14354;
                PCin       = 32'd52;
                Shamt      = 5'd0;
                RAddrIn    = 5'd7;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd1904886928) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd52       ) &&
                (RAddrOut    == 5'd7         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd19088743;
                B          = 32'd19088743;
                Immediate  = 32'd4;
                PCin       = 32'd56;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd4;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd56       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd16400;
                PCin       = 32'd60;
                Shamt      = 5'd0;
                RAddrIn    = 5'd8;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2630004  ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd60       ) &&
                (RAddrOut    == 5'd8         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd18450;
                PCin       = 32'd64;
                Shamt      = 5'd0;
                RAddrIn    = 5'd9;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2525992223) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd64       ) &&
                (RAddrOut    == 5'd9         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd19088743;
                B          = 32'd19088743;
                Immediate  = 32'd1;
                PCin       = 32'd68;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd1;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd68       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd20496;
                PCin       = 32'd72;
                Shamt      = 5'd0;
                RAddrIn    = 5'd10;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2714843  ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd72       ) &&
                (RAddrOut    == 5'd10        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd22546;
                PCin       = 32'd76;
                Shamt      = 5'd0;
                RAddrIn    = 5'd11;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd1904886928) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd76       ) &&
                (RAddrOut    == 5'd11        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd19088743;
                B          = 32'd19088743;
                Immediate  = 32'd5;
                PCin       = 32'd80;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd5;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd80       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd24592;
                PCin       = 32'd84;
                Shamt      = 5'd0;
                RAddrIn    = 5'd12;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2630004  ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd84       ) &&
                (RAddrOut    == 5'd12        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd26642;
                PCin       = 32'd88;
                Shamt      = 5'd0;
                RAddrIn    = 5'd13;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd2525992223) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd88       ) &&
                (RAddrOut    == 5'd13        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd305419896;
                B          = 32'd19088743;
                Immediate  = 32'd25;
                PCin       = 32'd92;
                Shamt      = 5'd0;
                RAddrIn    = 5'd2;
                Func       = 6'd25;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd19088743 ) &&
                (PCout       == 32'd92       ) &&
                (RAddrOut    == 5'd2         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd28688;
                PCin       = 32'd96;
                Shamt      = 5'd0;
                RAddrIn    = 5'd14;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd1357421  ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd96       ) &&
                (RAddrOut    == 5'd14        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd30738;
                PCin       = 32'd100;
                Shamt      = 5'd0;
                RAddrIn    = 5'd15;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd3099927112) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd100      ) &&
                (RAddrOut    == 5'd15        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd305419896;
                B          = 32'd0;
                Immediate  = 32'd17;
                PCin       = 32'd104;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd17;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd104      ) &&
                (RAddrOut    == 5'd0         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd19088743;
                B          = 32'd0;
                Immediate  = 32'd19;
                PCin       = 32'd108;
                Shamt      = 5'd0;
                RAddrIn    = 5'd0;
                Func       = 6'd19;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd0        ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd108      ) &&
                (RAddrOut    == 5'd0         ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 0            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd4294934544;
                PCin       = 32'd112;
                Shamt      = 5'd0;
                RAddrIn    = 5'd16;
                Func       = 6'd16;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd305419896) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd112      ) &&
                (RAddrOut    == 5'd16        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
                
        #15ns   nReset     = 1;
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
                A          = 32'd0;
                B          = 32'd0;
                Immediate  = 32'd4294936594;
                PCin       = 32'd116;
                Shamt      = 5'd0;
                RAddrIn    = 5'd17;
                Func       = 6'd18;
                MemfuncIn  = 3'd0;
                
        #5ns    assert(
                (Out         == 32'd19088743 ) &&
                (RtDataOut   == 32'd0        ) &&
                (PCout       == 32'd116      ) &&
                (RAddrOut    == 5'd17        ) &&
                (MemfuncOut  == 3'd0         ) &&
                (RegWriteOut == 1            ) &&
                (MemReadOut  == 0            ) &&
                (MemtoRegOut == 0            ) &&
                (MemWriteOut == 0            ) &&
                (BranchTaken == 0            )
                )
                else
                    $error("Failed at time %d", $time);
    end
                 
endmodule