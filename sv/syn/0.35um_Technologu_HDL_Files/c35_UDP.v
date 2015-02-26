// Verilog UDP library for all c35 CORELIB voltages
// $Id: udp.v,v 1 2004/12/04 13:12:19 bka
// Owner: austriamicrosystems AG  HIT-Kit: Digital


primitive DFF_UDP (Q, D, C, S, R, notifier);
  output Q;
  input D,C,S,R;
  input notifier;
  reg Q;
 
  table
  // D  C    S   R ntf : Qt: Qt+1
     0 (01)  1   ?  ?  : ? : 0 ; // rising clk d = 0
     1 (01)  ?   1  ?  : ? : 1 ; // rising clk d = 1
     0 (0?)  1   ?  ?  : 0 : 0 ; // rising clk d = q
     1 (0?)  ?   1  ?  : 1 : 1 ; // rising clk d = q
     0 (?1)  1   ?  ?  : 0 : 0 ; // rising clk d = q
     1 (?1)  ?   1  ?  : 1 : 1 ; // rising clk d = q
     ? (1?)  1   1  ?  : ? : - ; // falling clk
     ? (?0)  1   1  ?  : ? : - ; // falling clk
     *  ?    1   1  ?  : ? : - ; // data change
     ?  ?  (?1)  1  ?  : ? : - ; // set inactive
     ?  ?    1 (?1) ?  : ? : - ; // reset inactive
     ?  ?    1   0  ?  : ? : 0 ; // reset
     ?  ?    0   1  ?  : ? : 1 ; // set
     ?  ?    0   0  ?  : ? : x ; // set && reset
     ?  ?    x   ?  ?  : ? : x ; //
     ?  ?    ?   x  ?  : ? : x ; //
     ?  ?    ?   ?  *  : ? : x ; // timing violation
  endtable
endprimitive

primitive LATCH_UDP (Q, G, C, S, R, notifier);
  output Q;
  input G,C,S,R;
  input notifier;
  reg Q;
 
  table
  // D  G  S  R ntf : Qt: Qt+1
     0  0  1  ?  ?  : ? : 0 ; // open gate d = 0
     1  0  ?  1  ?  : ? : 1 ; // open gate d = 1
     0  ?  1  ?  ?  : 0 : 0 ; // any gate d = q
     1  ?  ?  1  ?  : 1 : 1 ; // any gate d = q
     ?  1  1  1  ?  : ? : - ; // closed gate
     ?  ?  ?  0  ?  : ? : 0 ; // reset
     ?  ?  0  1  ?  : ? : 1 ; // set
     ?  ?  ?  ?  *  : ? : x ; // timing violation
  endtable
endprimitive

primitive MUX_UDP (Q, A, B, S);
  output Q;
  input A, B, S;
 
  table
  // A B S : Q
     0 0 ? : 0 ;
     1 1 ? : 1 ;
     0 ? 0 : 0 ;
     1 ? 0 : 1 ;
     ? 0 1 : 0 ;
     ? 1 1 : 1 ;
  endtable
endprimitive

primitive JK_UDP (JK, J, K, Q);
  output JK;
  input J,K,Q;
 
  table
  // J K Q : JK
     0 1 ? : 0 ; // reset
     1 0 ? : 1 ; // set
     0 ? 0 : 0 ; // no change
     1 ? 0 : 1 ; // toggle
     ? 1 1 : 0 ; // toggle
     ? 0 1 : 1 ; // no change
  endtable
endprimitive

// Description :  FULL ADDER SUM TERM

primitive U_ADDR2_S (S, A, B, CI);
    output S;
    input A, B, CI;

    table
    //  A   B   CI  :   S
        0   0   0   :   0 ;
        0   0   1   :   1 ;
        0   1   0   :   1 ;
        0   1   1   :   0 ;
        1   0   0   :   1 ;
        1   0   1   :   0 ;
        1   1   0   :   0 ;
        1   1   1   :   1 ;
    endtable
endprimitive 


// Description :  FULL ADDER CARRY OUT TERM

primitive U_ADDR2_C   (CO, A, B, CI);
    output CO;
    input A, B, CI;

    table
    //  A   B   CI  :   CO
        1   1   ?   :   1 ;
        1   ?   1   :   1 ;
        ?   1   1   :   1 ;
        0   0   ?   :   0 ;
        0   ?   0   :   0 ;
        ?   0   0   :   0 ;
    endtable
endprimitive   

// Description :  POSITIVE EDGE TRIGGERED D FLIP-FLOP ( Q OUTPUT UDP ).

primitive U_FD_P_NO (Q, D, CP, NOTIFIER_REG); 

    output Q;  
    input  NOTIFIER_REG,
           D, CP;
    reg    Q;  

    table
    //  D   CP    NOTIFIER_REG  :   Qt  :   Qt+1
        1   (01)     ?          :   ?   :   1;  // clocked data
        0   (01)     ?          :   ?   :   0;
        1   (?1)     ?          :   1   :   1;  // reducing pessimism
        0   (?1)     ?          :   0   :   0;
        1   (0?)     ?          :   1   :   1;
        0   (0?)     ?          :   0   :   0;
        ?   (1?)     ?          :   ?   :   -;  // no change on falling edge
        ?   (?0)     ?          :   ?   :   -;
        *    ?       ?          :   ?   :   -;  // ignore edges on data
        ?    ?       *          :   ?   :   x;
    endtable
endprimitive


// Description : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH ACTIVE LOW
//            ASYNCHRONOUS CLEAR ( Q OUTPUT UDP ).

primitive U_FD_P_RB_NO (Q, D, CP, RB, NOTIFIER_REG); 

    output Q;  
    input  NOTIFIER_REG,
           D, CP, RB;
    reg    Q;     

    table 
    //  D   CP      RB NOTIFIER_REG  :   Qt  :   Qt+1
        1   (01)    1     ?          :   ?   :   1;  // clocked data
        0   (01)    ?     ?          :   ?   :   0;
        1   (?1)    1     ?          :   1   :   1;  // reducing pessimism
        0   (?1)    ?     ?          :   0   :   0;                          
        1   (0?)    1     ?          :   1   :   1;  
        0   (0?)    ?     ?          :   0   :   0;  
        ?   (?0)    1     ?          :   ?   :   -;  // ignore falling clock
        ?   (1?)    1     ?          :   ?   :   -;  // ignore falling clock
        ?    ?      0     ?          :   ?   :   0;  // asynchronous clear
        ?    ?      x     ?          :   ?   :   x;  // pessimism
        *    ?      1     ?          :   ?   :   -;  // ignore the edges on data
        ?    ?    (?1)    ?          :   ?   :   -;  // ignore the edges on clear 
        ?    ?      ?     *          :   ?   :   x; 
    endtable
endprimitive


// Description : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH ACTIVE LOW
//            ASYNCHRONOUS SET AND CLEAR. ( Q OUTPUT UDP ).

primitive U_FD_P_RB_SB_NO (Q, D, CP, RB, SB, NOTIFIER_REG); 

    output Q;  
    input  NOTIFIER_REG,
           D, CP, RB, SB;
    reg    Q; 

    table 
    //  D   CP      RB  SB NOTIFIER_REG  :   Qt  :   Qt+1
        1   (01)    1   ?     ?          :   ?   :   1;  // clocked data  bk
        0   (01)    ?   1     ?          :   ?   :   0;  // clocked data  bk
        1   (?1)    1   ?     ?          :   1   :   1; 
        0   (?1)    ?   1     ?          :   0   :   0;
        1   (0?)    1   ?     ?          :   1   :   1; 
        0   (0?)    ?   1     ?          :   0   :   0;  
        ?   (?0)    1   1     ?          :   ?   :   -;  // ignore falling clock
        ?   (1?)    1   1     ?          :   ?   :   -;  // ignore falling clock
        ?   ?       0   1     ?          :   ?   :   0;  // asynchronous clear
        ?   ?       1   0     ?          :   ?   :   1;  // asynchronous set
        ?   ?       x   ?     ?          :   ?   :   x;  // pessimism
        ?   ?       ?   x     ?          :   ?   :   x;  // pessimism
        *   ?       1   1     ?          :   ?   :   -;  // ignore data edges 
        ?   ?     (?1)  1     ?          :   ?   :   -;  // ignore the edges on 
        ?   ?       1  (?1)   ?          :   ?   :   -;  // set and clear 
        ?   ?       0   0     ?          :   ?   :   x;  // set and clear 
        ?   ?       ?   ?     *          :   ?   :   x;
    endtable
endprimitive

    
// Description : POSITIVE EDGE TRIGGERED D FLIP-FLOP WITH ACTIVE LOW
//            ASYNCHRONOUS SET ( Q OUTPUT UDP )

primitive U_FD_P_SB_NO (Q, D, CP, SB, NOTIFIER_REG); 

    output Q;  
    input  NOTIFIER_REG,
           D, CP, SB;
    reg    Q; 

    table 
    //  D   CP      SB NOTIFIER_REG  :   Qt  :   Qt+1
        1   (01)    ?     ?          :   ?   :   1;  // clocked data
        0   (01)    1     ?          :   ?   :   0;
        1   (?1)    ?     ?          :   1   :   1;  // reducing pessimism
        0   (?1)    1     ?          :   0   :   0;                          
        1   (0?)    ?     ?          :   1   :   1;  
        0   (0?)    1     ?          :   0   :   0;  
        ?   (?0)    1     ?          :   ?   :   -;  // ignore falling clock
        ?   (1?)    1     ?          :   ?   :   -;  // ignore falling clock
        ?    ?      0     ?          :   ?   :   1;  // asynchronous clear
        ?    ?      x     ?          :   ?   :   x;  // pessimism
        *    ?      ?     ?          :   ?   :   -;  // ignore the data edges
        ?   ?     (?1)    ?          :   ?   :   -;  // ignore the edges on set
        ?   ?       ?     *          :   ?   :   x;
   endtable
endprimitive



// Description : POSITIVE EDGE TRIGGERED JK FLIP FLOP, STANDARD DRIVE ( Q OUTPUT UDP )
//  

primitive U_FJK_P_NO (Q, J, K, CP, NOTIFIER_REG); 
    output Q;
    reg    Q;  
    input  NOTIFIER_REG,
           J,K,
           CP;                                  // Clock.

    table
      //    J   K   CP  NOTIFIER_REG  :  Qtn   :   Qtn+1
            0   0   r      ?          :   ?    :     - ;      // Output retains the 
            0   1   r      ?          :   ?    :     0 ;      // reset
            1   0   r      ?          :   ?    :     1 ;      // set
            1   ?   p      ?          :   0    :     1 ;      // Clocked toggle.
            ?   1   p      ?          :   1    :     0 ;
            0   ?   p      ?          :   0    :     0 ;      // no change
            ?   0   p      ?          :   1    :     1 ;      // no change
            *   ?   ?      ?          :   ?    :     - ;      // Insensitive to 
            ?   *   ?      ?          :   ?    :     - ;      // transitions on J and K
                                                              // with steady clock.  
            ?   ?   n      ?          :   ?    :     - ;      //ignore falling clock.  
            ?   ?   ?      *          :   ?    :     x ;
    endtable
endprimitive


primitive U_FJK_P_RB_NO (Q, J, K, CP, RB, NOTIFIER_REG); 
    output Q;
    reg    Q;  
    input  NOTIFIER_REG,
           J,K,
            CP,                                  // CLOCK.
            RB;                                  // CLEAR INPUT.
// FUNCTION : POSITIVE EDGE TRIGGERED JK FLIP FLOP, WITH CLEAR 
//            ACTIVE LOW / STANDARD DRIVE ( Q OUTPUT UDP )


    table
      // J   K   CP  RB      NOTIFIER_REG  :  Qtn : Qtn+1

         0   0  (01)  1         ?          :   ?  :   - ;         // Output retains the 
                                                                  // present state if both 
                                                                  // J and K are 0.
         0   1  (01)  1         ?          :   ?  :   0 ;         // Clocked J and K.
         1   0  (01)  1         ?          :   ?  :   1 ;    

         ?   ?   ?    x         ?          :   ?  :   x ;         // pessimism

         1   1  (01)  1         ?          :   0  :   1 ;         // Clocked toggle.
         1   1  (01)  1         ?          :   1  :   0 ;

         0   0  (x1)  1         ?          :   ?  :   - ;         //possible clocked JK
         0   1  (x1)  1         ?          :   0  :   0 ;   
         1   0  (x1)  1         ?          :   1  :   1 ;
         0   0  (0x)  1         ?          :   ?  :   - ;
         0   1  (0x)  1         ?          :   0  :   0 ;
         1   0  (0x)  1         ?          :   1  :   1 ;

         *   ?   ?    1         ?          :   ?  :   - ;         // Insensitive to 
         ?   *   ?    1         ?          :   ?  :   - ;         // transitions on J and K
                                                                  // with steady clock.
         ?   ? (?0)   1         ?          :   ?  :   - ;         //ignore falling clock.
         ?   ? (1x)   1         ?          :   ?  :   - ; 

         ?   ?   ?    0         ?          :   ?  :   0 ;         // Clear. 

         ?   ?   ?   (?1)       ?          :   ?  :   - ;         // Insensitive to a rising
                                                                  // edge on CD.
         ?   ?   ?    ?         *          :   ?  :   x ;         


    endtable

endprimitive




// Description : POSITIVE EDGE TRIGGERED JK FLIP FLOP, WITH ACTIVE LOW 
//            ASYNCHRONOUS CLEAR AND  SET  ( Q OUTPUT UDP ).
 
primitive U_FJK_P_RB_SB_NO (Q, J, K, CP, RB, SB, NOTIFIER_REG); 
    output Q;
    reg    Q;  
    input  NOTIFIER_REG,
           J,K,
            CP,                                  // Clock.
            RB,                                  // Clear input
            SB;                                  // Set input  

    table
      // J   K   CP   RB   SB  NOTIFIER_REG  : Qtn : Qtn+1

         0   0   r    1    1      ?          :   ?    :     - ;      // Output retains the 
         0   1   r    ?    1      ?          :   ?    :     0 ;      // reset
         1   0   r    1    ?      ?          :   ?    :     1 ;      // set
         1   ?   p    1    ?      ?          :   0    :     1 ;      // Clocked toggle.
         ?   1   p    ?    1      ?          :   1    :     0 ;
         0   ?   p    ?    1      ?          :   0    :     0 ;      // no change
         ?   0   p    1    ?      ?          :   1    :     1 ;      // no change
         *   ?   ?    1    1      ?          :   ?    :     - ;      // Insensitive to 
         ?   *   ?    1    1      ?          :   ?    :     - ;      // transitions on J and K
                                                              // with steady clock.  
         ?   ?   n    1    1      ?          :   ?    :     - ;      //ignore falling clock.  
         ?   ?   ?    0    1      ?          :   ?    :     0 ;
         ?   ?   ?    1    0      ?          :   ?    :     1 ;
         ?   ?   ?    x    1      ?          :   ?    :     x ;
         ?   ?   ?    1    x      ?          :   ?    :     x ;
         ?   ?   ?    0    0      ?          :   ?    :     x ;
         ?   ?   ?    p    1      ?          :   ?    :     - ;
         ?   ?   ?    1    p      ?          :   ?    :     - ;
         ?   ?   ?    ?    ?      *          :   ?    :     x ; 

    endtable
endprimitive


// Description : POSITIVE EDGE TRIGGERED J K FLIP FLOP, WITH
//            ASYNCHRONOUS ACTIVE LOW SET  ( Q OUTPUT UDP )  

primitive U_FJK_P_SB_NO (Q, J, K, CP, SB, NOTIFIER_REG); 
    output Q;
    reg    Q;  
    input  NOTIFIER_REG,
           J,K,
            CP,                                  // CLOCK.
            SB;                                  // SET INPUT.

    table
      // J   K   CP  SB  NOTIFIER_REG  :  Qtn : Qtn+1
         0   0  (01)  1     ?          :   ?  :   - ;         // Output retains the 
                                                              // present state if both 
                                                              // J and K are 0.
         0   1  (01)  1     ?          :   ?  :   0 ;         // Clocked J and K.
         1   0  (01)  1     ?          :   ?  :   1 ;    
         1   0  (01)  x     ?          :   ?  :   1 ;         // pessimism
         ?   ?   ?    x     ?          :   1  :   1 ;         // pessimism
         1   1  (01)  1     ?          :   0  :   1 ;         // Clocked toggle.
         1   1  (01)  1     ?          :   1  :   0 ;
         1   ?  (01)  x     ?          :   0  :   1 ;         // pessimism
         0   0  (?1)  1     ?          :   ?  :   - ;         //possible clocked JK
         0   1  (?1)  1     ?          :   0  :   0 ;   
         1   0  (?1)  1     ?          :   1  :   1 ;
         0   0  (0?)  1     ?          :   ?  :   - ;
         0   1  (0?)  1     ?          :   0  :   0 ;
         1   0  (0?)  1     ?          :   1  :   1 ;
         *   ?   ?    1     ?          :   ?  :   - ;         // Insensitive to 
         ?   *   ?    1     ?          :   ?  :   - ;         // transitions on J and K
                                                              // with steady clock.
         ?   ? (?0)   1     ?          :   ?  :   - ;         //ignore falling clock.
         ?   ? (1?)   1     ?          :   ?  :   - ;                                         
         x   0   r    1     ?          :   1  :   1 ;         // reducing pessimism for unknown J 
         x   1   r    1     ?          :   1  :   0 ;         // reducing pessimism for unknown J 
         0   x   r    1     ?          :   0  :   0 ;         // reducing pessimism for unknown K 
         1   x   r    1     ?          :   0  :   1 ;         // reducing pessimism for unknown K 
         x   0  (?1)  1     ?          :   1  :   1 ;        //possible clocked with
         0   x  (?1)  1     ?          :   0  :   0 ;        //possible J & K                                 
         x   0  (0?)  1     ?          :   1  :   1 ;
         0   x  (0?)  1     ?          :   0  :   0 ;
         ?   ?   ?    0     ?          :   ?  :   1 ;         // SET. 
         ?   ?   ?   (?1)   ?          :   ?  :   - ;         // Insensitive to a rising
         ?   ?   ?    ?     *          :   ?  :   x ;         // edge on SB
    endtable
endprimitive


// Description :  TOGGLE FLIP FLOP WITH CLEAR ACTIVE LOW / STANDARD DRIVE ( Q OUTPUT UDP )

primitive U_FT_P_RB_NO (Q, CP, RB, NOTIFIER_REG); 
    output Q; 
    reg    Q;
    input  NOTIFIER_REG,
           CP,                                     // Clock.
           RB;                                     // Clear input

    table
      //   CP       RB   NOTIFIER_REG  :  QTN  :  QTN+1
           r        1       ?          :   0   :    1   ;     // Toggle condition.
           r        ?       ?          :   1   :    0   ;
          (?0)      1       ?          :   ?   :    -   ;
          (1?)      1       ?          :   ?   :    -   ;
           ?        0       ?          :   ?   :    0   ;  
           ?       (?1)     ?          :   ?   :    -   ;     // inact
           0        x       ?          :   ?   :    0   ;     // pessimism
           ?        ?       *          :   ?   :    x   ; 
    endtable
endprimitive


// Description : POSITIVE EDGE TRIGGERED TOGGLE FLIP FLOP WITH
//            ASYNCHRONOUS SET ( ACTIVE LOW ) /STANDARD DRIVE ( Q OUTPUT UDP ).

primitive U_FT_P_SB_NO (Q, CP, SB, NOTIFIER_REG);  

    output Q; 
    reg    Q;
    input  NOTIFIER_REG,
           CP,                                     // Clock.
           SB;                                     // Set input 

    table
      //   CP       SB   NOTIFIER_REG  :  QTN  :  QTN+1
           r        1       ?          :   0   :    1   ;     // Toggle condition.
           r        1       ?          :   1   :    0   ;
          (?1)      1       ?          :   0   :    1   ;     // Toggle condition.
          (?1)      1       ?          :   1   :    0   ;
          (?0)      1       ?          :   ?   :    -   ;
          (1?)      1       ?          :   ?   :    -   ;
           ?       (?1)     ?          :   ?   :    -   ;
           ?        0       ?          :   ?   :    1   ;     
           r        x       ?          :   ?   :    x   ;     // pessimism
           ?        x       ?          :   ?   :    x   ;     // pessimism
           ?        ?       *          :   ?   :    x   ; 
   endtable                                  
endprimitive

    
// Description : POSITIVE EDGE TRIGGERED TOGGLE FLIP FLOP WITH ACTIVE LOW CLEAR
//            AND TOGGLE ENABLE ( Q OUTPUT UDP ) .

primitive U_FT_P_TE_RB_NO (Q, TE, CP, RB, NOTIFIER_REG); 

    output Q; 
    reg    Q;
    input  NOTIFIER_REG,
           TE,
           CP,                                     // Clock
           RB;                                     // Clear input  

    table
      //   TE     CP       RB   NOTIFIER_REG  :  QTN  :  QTN+1
           1      r        1       ?          :   0   :    1   ;     // Toggle condition.
           1      r        1       ?          :   1   :    0   ;                         
           1     (?0)      1       ?          :   ?   :    -   ;
           1     (1?)      1       ?          :   ?   :    -   ;                         
           ?      ?       (?1)     ?          :   ?   :    -   ;
           ?      ?        0       ?          :   ?   :    0   ;  
           ?      r        x       ?          :   ?   :    x   ;     // pessimism
           ?      ?        x       ?          :   ?   :    x   ;
           0     (??)      1       ?          :   ?   :    -   ;  
           *      ?        1       ?          :   ?   :    -   ;  
           ?      ?        ?       *          :   ?   :    x   ;  
    endtable
endprimitive


// Description :  D-LATCH, GATED  ACTIVE LOW / STANDARD DRIVE ( Q OUTPUT UDP )
//

primitive U_LD_N_NO (Q, D, GN, NOTI_REG); 

    output Q; 
    reg    Q;                               
    input  D,                // data
           GN,               // clock
           NOTI_REG;         // NOTIFY_REG

   table
     //  D       GN    NOTI_REG : Qt  :   Qt+1
         ?        1     ?       :  ?  :    -   ;   // inact
         0        0     ?       :  ?  :    0   ;   // open
         1        0     ?       :  ?  :    1   ;   // open
         ?        ?     *       :  ?  :    x   ;
   endtable
endprimitive



// Description : NEGATIVE LEVEL SENSITIVE D-TYPE LATCH WITH ACTIVE LOW
//            ASYNCHRONOUS SET ( Q OUTPUT UDP ).

primitive U_LD_N_SB_NO (Q, D, GN, SB, NOTI_REG); 

    output Q; 
    reg    Q;                               
    input  D,               // DATA
           GN,              // CLOCK
           SB,              // SET ACTIVE LOW
           NOTI_REG;        // NOTIFY REG

   table
     //  D      GN       SB    NOTI_REG : Qt  :   Qt+1                     
         ?      1        1      ?       :  ?  :    -   ; //closed gate                 
         ?      ?        0      ?       :  ?  :    1   ; // asynchro SET  
         0      0        1      ?       :  ?  :    0   ; // open
         1      0        ?      ?       :  ?  :    1   ; // open
         1      ?        ?      ?       :  1  :    1   ;   
         ?      ?        ?      *       :  ?  :    x   ;                     
   endtable
endprimitive


// Description : D-LATCH, GATED  CLEAR DIRECT /GATE ACTIVE HIGH ( Q OUTPUT UDP ) 

primitive U_LD_P_RB_NO (Q, D, G, RB, NOTI_REG); 

    output Q; 
    reg    Q;                               
    input  D,               // DATA
           G,               // CLOCK
           RB,              // CLEAR ACTIVE LOW
           NOTI_REG;        // NOTIFY REG

   table
     //  D      G       RB    NOTI_REG : Qt  :   Qt+1
         ?      1        1      ?       :  ?  :    -   ; //closed gate                 
         ?      ?        0      ?       :  ?  :    0   ; // asynchro RESET  
         0      0        ?      ?       :  ?  :    0   ; // open
         1      0        1      ?       :  ?  :    1   ; // open
         0      ?        ?      ?       :  0  :    0   ;   
         ?      ?        ?      *       :  ?  :    x   ;    
   endtable
endprimitive


// Description :  TWO TO ONE MULTIPLEXER

primitive U_MUX_2_1 (Q, A, B, SL);
    output Q;
    input A, B, SL;

    table
    //  A   B   SL  :   Q
        0   0   ?   :   0 ;
        1   1   ?   :   1 ;
        0   ?   0   :   0 ;
        1   ?   0   :   1 ;
        ?   0   1   :   0 ;
        ?   1   1   :   1 ;
    endtable
endprimitive    

   
// Description :  TWO TO ONE MULTIPLEXER  WITH INVERTING OUTPUT

primitive U_MUX_2_1_INV (Y, D0, D1, S);

    input D0, D1, S;
    output Y;

    table
//   D0  D1  S  : Y 
     0   ?   0  : 1 ;
     1   ?   0  : 0 ;
     ?   0   1  : 1 ;
     ?   1   1  : 0 ;
     0   0   ?  : 1 ;
     1   1   ?  : 0 ;
     endtable
endprimitive


// Description :  THREE TO ONE MULTIPLEXER WITH 2 SELECT CONTROLS
//             AND INVERTING OUTPUT 

primitive U_MUX_3_2 (Y, D0, D1, D2, S0, S1);

    input D0, D1, D2, S0, S1;
    output Y;

    table
//   D0  D1  D2   S0 S1 : Y
     0   ?   ?    0  0  : 0 ; 
     1   ?   ?    0  0  : 1 ;                                  
     ?   0   ?    1  0  : 0 ; 
     ?   1   ?    1  0  : 1 ;                                
     ?   ?   0    ?  1  : 0 ; 
     ?   ?   1    ?  1  : 1 ;                                                                                         
     0   0   0    ?  ?  : 0 ;     //pessimism                       
     1   1   1    ?  ?  : 1 ; 
     0   0   ?    ?  0  : 0 ;     //pessimism
     1   1   ?    ?  0  : 1 ;     //pessimism
     0   ?   0    0  ?  : 0 ; 
     1   ?   1    0  ?  : 1 ; 
     ?   0   0    1  ?  : 0 ; 
     ?   1   1    1  ?  : 1 ; 
     endtable
endprimitive

// Description :  THREE TO ONE MULTIPLEXER WITH 2 SELECT CONTROLS
//             AND INVERTING OUTPUT 

primitive U_MUX_3_2_INV (Y, D0, D1, D2, S0, S1);

    input D0, D1, D2, S0, S1;
    output Y;

    table
//   D0  D1  D2   S0 S1 : Y                       
     0   ?   ?    0  0  : 1 ; 
     1   ?   ?    0  0  : 0 ; 
     ?   0   ?    1  0  : 1 ; 
     ?   1   ?    1  0  : 0 ;                                  
     ?   ?   0    ?  1  : 1 ; 
     ?   ?   1    ?  1  : 0 ;                                  
     0   0   0    ?  ?  : 1 ;     //pessimism                       
     1   1   1    ?  ?  : 0 ; 
     0   0   ?    ?  0  : 1 ;     //pessimism
     1   1   ?    ?  0  : 0 ;     //pessimism
     0   ?   0    0  ?  : 1 ; 
     1   ?   1    0  ?  : 0 ; 
     ?   0   0    1  ?  : 1 ; 
     ?   1   1    1  ?  : 0 ;                  
     endtable
endprimitive


// Description :  FOUR TO ONE MULTIPLEXER WITH 2 SELECT CONTROLS

primitive U_MUX_4_2 (Y, D0, D1, D2, D3, S0, S1);

    input D0, D1, D2, D3, S0, S1;
    output Y;
   
    table
//   D0  D1  D2 D3  S0  S1 : Y                       
     0   ?   ?  ?    0  0  : 0 ; 
     1   ?   ?  ?    0  0  : 1 ;                                  
     ?   0   ?  ?    1  0  : 0 ; 
     ?   1   ?  ?    1  0  : 1 ; 
     ?   ?   0  ?    0  1  : 0 ; 
     ?   ?   1  ?    0  1  : 1 ;                                  
     ?   ?   ?  0    1  1  : 0 ; 
     ?   ?   ?  1    1  1  : 1 ;                                  
     0   0   0   0   ?  ?  : 0 ; 
     1   1   1   1   ?  ?  : 1 ; 
     0   0   ?   ?   ?  0  : 0 ;    
     1   1   ?   ?   ?  0  : 1 ; 
     ?   ?   0   0   ?  1  : 0 ; 
     ?   ?   1   1   ?  1  : 1 ; 
     0   ?   0   ?   0  ?  : 0 ; 
     1   ?   1   ?   0  ?  : 1 ; 
     ?   0   ?   0   1  ?  : 0 ; 
     ?   1   ?   1   1  ?  : 1 ; 
     endtable
endprimitive


// Description :  FOUR TO ONE MULTIPLEXER WITH 2 SELECT CONTROLS
//             AND INVERTING OUTPUT    

primitive U_MUX_4_2_INV (Y, D0, D1, D2, D3, S0, S1);

    input D0, D1, D2, D3, S0, S1;
    output Y;

    table
//   D0  D1  D2 D3   S0 S1 : Y                      
     0   ?   ?  ?    0  0  : 1 ; 
     1   ?   ?  ?    0  0  : 0 ;                                  
     ?   0   ?  ?    1  0  : 1 ; 
     ?   1   ?  ?    1  0  : 0 ;                                  
     ?   ?   0  ?    0  1  : 1 ; 
     ?   ?   1  ?    0  1  : 0 ;                                  
     ?   ?   ?  0    1  1  : 1 ; 
     ?   ?   ?  1    1  1  : 0 ;                                  
     0   0   0   0   ?  ?  : 1 ;     //pessimism                       
     1   1   1   1   ?  ?  : 0 ; 
     0   0   ?   ?   ?  0  : 1 ;     //pessimism
     1   1   ?   ?   ?  0  : 0 ;     //pessimism
     ?   ?   0   0   ?  1  : 1 ;     //pessimism
     ?   ?   1   1   ?  1  : 0 ;     //pessimism
     0   ?   0   ?   0  ?  : 1 ; 
     1   ?   1   ?   0  ?  : 0 ; 
     ?   0   ?   0   1  ?  : 1 ; 
     ?   1   ?   1   1  ?  : 0 ; 
     endtable
endprimitive


// Description  : BOOL_SCAN_DFF with rising clock  q and qb outputs

primitive U_dfse_Q(Q,C,E,SE,D,SD,notifier);

output Q;
reg    Q;
input  C,E,SE,D,SD,notifier;

table
// C    E    SE   D    SD   nfr : - : Q;
   r    ?    1    ?    1    ?   : ? : 1;
   r    ?    1    ?    0    ?   : ? : 0;
   r    1    0    0    ?    ?   : ? : 0;
   r    1    0    1    ?    ?   : ? : 1;
   n    ?    ?    ?    ?    ?   : ? : -;
   ?    *    ?    ?    ?    ?   : ? : -;
   ?    ?    *    ?    ?    ?   : ? : -;
   ?    ?    ?    *    ?    ?   : ? : -;
   ?    ?    ?    ?    *    ?   : ? : -;
   (??) 0    0    ?    ?    ?   : ? : -;
   ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : BOOL_SCAN_DFF with rising clock low clear q and qb outputs

primitive U_dfsec_Q(Q,C,RN,E,SE,D,SD,notifier);

output Q;
reg    Q;
input  C,RN,E,SE,D,SD,notifier;

table
// C    RN   E    SE   D    SD   nfr : - : Q;
   r    1    1    0    1    ?    ?   : ? : 1;
   r    1    1    0    0    ?    ?   : ? : 0;
   r    1    ?    1    ?    0    ?   : ? : 0;
   r    1    ?    1    ?    1    ?   : ? : 1;
   ?    0    ?    ?    ?    ?    ?   : ? : 0;
   n    1    ?    ?    ?    ?    ?   : ? : -;
   ?    x    ?    ?    ?    ?    ?   : ? : x;
   ?    (?1) ?    ?    ?    ?    ?   : ? : -;
   ?    1    *    ?    ?    ?    ?   : ? : -;
   ?    1    ?    *    ?    ?    ?   : ? : -;
   ?    1    ?    ?    *    ?    ?   : ? : -;
   ?    1    ?    ?    ?    *    ?   : ? : -;
   (??) 1    0    0    ?    ?    ?   : ? : -;
   ?    ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : BOOL_SCAN_DFF with rising clock low preset q and qb outputs 

primitive U_dfsep_Q(Q,C,SE,E,SN,D,SD,notifier);

output Q;
reg    Q;
input  C,SE,E,SN,D,SD,notifier;

table
// C    SE   E    SN   D    SD   nfr : - : Q;
   r    0    1    1    0    ?    ?   : ? : 0;
   r    0    1    1    1    ?    ?   : ? : 1;
   r    1    ?    1    ?    0    ?   : ? : 0;
   r    1    ?    1    ?    1    ?   : ? : 1;
   ?    ?    ?    0    ?    ?    ?   : ? : 1;
   ?    ?    ?    x    ?    ?    ?   : ? : x;
   n    ?    ?    1    ?    ?    ?   : ? : -;
   ?    *    ?    1    ?    ?    ?   : ? : -;
   ?    ?    *    1    ?    ?    ?   : ? : -;
   ?    ?    ?    (?1) ?    ?    ?   : ? : -;
   ?    ?    ?    1    *    ?    ?   : ? : -;
   ?    ?    ?    1    ?    *    ?   : ? : -;
   (??) 0    0    1    ?    ?    ?   : ? : -;
   ?    ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : SCAN_JKFF with rising clock  q and qb outputs

primitive U_jks_Q(Q,C,SE,J,K,SD,notifier);

output Q;
reg    Q;
input  C,SE,J,K,SD,notifier;

table
// C    SE   J    K    SD   nfr : - : Q;
   r    0    1    1    ?    ?   : 0 : 1;
   r    0    1    1    ?    ?   : 1 : 0;
   r    1    ?    ?    0    ?   : ? : 0;
   r    1    ?    ?    1    ?   : ? : 1;
   r    0    0    1    ?    ?   : ? : 0;
   r    0    1    0    ?    ?   : ? : 1;
   n    ?    ?    ?    ?    ?   : ? : -;
   ?    *    ?    ?    ?    ?   : ? : -;
   ?    ?    *    ?    ?    ?   : ? : -;
   ?    ?    ?    *    ?    ?   : ? : -;
   ?    ?    ?    ?    *    ?   : ? : -;
   (??) 0    0    0    0    ?   : ? : -;
   (??) 0    0    0    1    ?   : ? : -;
   ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : SCAN_JKFF with rising clock low clear q and qb outputs

primitive U_jksc_Q(Q,C,RN,SE,J,K,SD,notifier);

output Q;
reg    Q;
input  C,RN,SE,J,K,SD,notifier;

table
// C    RN   SE   J    K    SD   nfr : - : Q;
   r    1    0    1    0    ?    ?   : ? : 1;
   r    1    0    0    1    ?    ?   : ? : 0;
   r    1    0    1    1    ?    ?   : 0 : 1;
   r    1    0    1    1    ?    ?   : 1 : 0;
   r    1    1    ?    ?    1    ?   : ? : 1;
   r    1    1    ?    ?    0    ?   : ? : 0;
   ?    0    ?    ?    ?    ?    ?   : ? : 0;
   n    1    ?    ?    ?    ?    ?   : ? : -;
   ?    (?1) ?    ?    ?    ?    ?   : ? : -;
   ?    x    ?    ?    ?    ?    ?   : ? : x;
   ?    1    *    ?    ?    ?    ?   : ? : -;
   ?    1    ?    *    ?    ?    ?   : ? : -;
   ?    1    ?    ?    *    ?    ?   : ? : -;
   ?    1    ?    ?    ?    *    ?   : ? : -;
   (??) 1    0    0    0    0    ?   : ? : -;
   (??) 1    0    0    0    1    ?   : ? : -;
   ?    ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : SCAN_JKFF with rising clock low preset q and qb outputs

primitive U_jksp_Q(Q,C,SE,SN,J,K,SD,notifier);

output Q;
reg    Q;
input  C,SE,SN,J,K,SD,notifier;

table
// C    SE   SN   J    K    SD   nfr : - : Q;
   r    0    1    0    1    ?    ?   : ? : 0;
   r    0    1    1    1    ?    ?   : 0 : 1;
   r    0    1    1    1    ?    ?   : 1 : 0;
   r    1    1    ?    ?    1    ?   : ? : 1;
   r    0    1    1    0    ?    ?   : ? : 1;
   r    1    1    ?    ?    0    ?   : ? : 0;
   ?    ?    0    ?    ?    ?    ?   : ? : 1;
   n    ?    1    ?    ?    ?    ?   : ? : -;
   ?    *    1    ?    ?    ?    ?   : ? : -;
   ?    ?    (?1) ?    ?    ?    ?   : ? : -;
   ?    ?    x    ?    ?    ?    ?   : ? : x;
   ?    ?    1    *    ?    ?    ?   : ? : -;
   ?    ?    1    ?    *    ?    ?   : ? : -;
   ?    ?    1    ?    ?    *    ?   : ? : -;
   (??) 0    1    0    0    0    ?   : ? : -;
   (??) 0    1    0    0    1    ?   : ? : -;
   ?    ?    ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : TFF with rising edge clock,low preset,low clear,q and qb outputs

primitive U_tfcp_Q(Q,C,RN,SN,notifier);

output Q;
reg    Q;
input  C,RN,SN,notifier;

table
// C    RN   SN   nfr : - : Q;
   ?    1    0    ?   : ? : 1;
   ?    0    0    ?   : ? : 0;
   ?    0    1    ?   : ? : 0;
   r    1    1    ?   : 0 : 1;
   r    1    1    ?   : 1 : 0;
   n    1    1    ?   : ? : -;
   ?    (?1) 1    ?   : ? : -;
   ?    1    (?1) ?   : ? : -;
   ?    x    ?    ?   : ? : x;
   ?    ?    x    ?   : ? : x;
   ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : TFF with rising edge clock,low preset,low clear,high enable,q and qb outputs

primitive U_tfecp_Q(Q,C,RN,SN,T,notifier);

output Q;
reg    Q;
input  C,RN,SN,T,notifier;

table
// C    RN   SN   T    nfr : - : Q;
   ?    1    0    ?    ?   : ? : 1;
   ?    0    0    ?    ?   : ? : 0;
   ?    0    1    ?    ?   : ? : 0;
   r    1    1    1    ?   : 0 : 1;
   r    1    1    1    ?   : 1 : 0;
   n    1    1    ?    ?   : ? : -;
   ?    (?1) 1    ?    ?   : ? : -;
   ?    1    (?1) ?    ?   : ? : -;
   ?    x    ?    ?    ?   : ? : x;
   ?    ?    x    ?    ?   : ? : x;
   ?    1    1    *    ?   : ? : -;
   (??) 1    1    0    ?   : ? : -;
   ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : TFF with rising edge clock,low preset,high enable,q and qb outputs

primitive U_tfep_Q(Q,SN,C,T,notifier);

output Q;
reg    Q;
input  SN,C,T,notifier;

table
// SN   C    T    nfr : - : Q;
   1    r    1    ?   : 0 : 1;
   1    r    1    ?   : 1 : 0;
   0    ?    ?    ?   : ? : 1;
   (?1) ?    ?    ?   : ? : -;
   1    n    ?    ?   : ? : -;  
   1    ?    *    ?   : ? : -;
   1    (??) 0    ?   : ? : -;
   x    ?    ?    ?   : ? : x;
   ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : SCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfsc_Q(Q,C,RN,SE,SD,notifier);

output Q;
reg    Q;
input  C,RN,SE,SD,notifier;

table
// C    RN   SE   SD   nfr : - : Q;
   r    1    0    ?    ?   : 0 : 1;
   r    1    0    ?    ?   : 1 : 0;
   ?    0    ?    ?    ?   : ? : 0;
   r    1    1    0    ?   : ? : 0;
   r    1    1    1    ?   : ? : 1;
   n    1    ?    ?    ?   : ? : -;
   ?    (?1) ?    ?    ?   : ? : -;
   ?    1    *    ?    ?   : ? : -;
   ?    1    ?    *    ?   : ? : -;
   ?    x    ?    ?    ?   : ? : x;
   ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive


// Description  : SCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfsp_Q(Q,C,SE,SN,SD,notifier);

output Q;
reg    Q;
input  C,SE,SN,SD,notifier;

table
// C    SE   SN   SD   nfr : - : Q;
   r    1    1    0    ?   : ? : 0;
   r    0    1    ?    ?   : 0 : 1;
   r    0    1    ?    ?   : 1 : 0;
   r    1    1    1    ?   : ? : 1;
   ?    ?    0    ?    ?   : ? : 1;
   n    ?    1    ?    ?   : ? : -;
   ?    *    1    ?    ?   : ? : -;
   ?    ?    (?1) ?    ?   : ? : -;
   ?    ?    1    *    ?   : ? : -;
   r    ?    x    ?    ?   : ? : x;
   ?    ?    x    ?    ?   : ? : x;
   ?    ?    ?    ?    *   : ? : x;
endtable
endprimitive



// Description : D-LATCH, GATED  CLEAR DIRECT /GATE ACTIVE LOW ( Q OUTPUT UDP ) 

primitive U_LD_P_RB_SB_NO (Q, D, GB, RB, SB,NOTI_REG); 

    output Q; 
    reg    Q;                               
    input  D,               // DATA
           GB,              // CLOCK
           RB,              // CLEAR ACTIVE LOW
           SB,              // SET ACTIVE LOW
           NOTI_REG;        // NOTIFY REG

   table
     //  D       GB     RB    SB    NOTI_REG : Qt  :   Qt+1
         ?       1      1     1      ?       :  ?  :    -   ; // closed gate
         ?       ?      0     1      ?       :  ?  :    0   ; // asynchro clear
         ?       ?      1     0      ?       :  ?  :    1   ; // asynchro set
         1       0      1     ?      ?       :  ?  :    1   ; // set
         0       0      ?     1      ?       :  ?  :    0   ; // reset
         0       ?      ?     1      ?       :  0  :    0   ; // comb
         1       ?      1     ?      ?       :  1  :    1   ; // comb
         ?       ?      ?     ?      *       :  ?  :    x   ; // timing violation
   endtable
endprimitive


// Description  : BOOL_SCAN_DFF with rising clock low clear low pres q and qb outputs

primitive U_dfsecp_Q(Q,C,RN,SN,E,SE,D,SD,notifier);

output Q;
reg    Q;
input  C,RN,SN,E,SE,D,SD,notifier;

table
// C    RN   SN    E    SE   D    SD   nfr : - : Q;
   r    ?    1     1    0    0    ?    ?   : ? : 0;    //D=0 SE0
   r    1    ?     1    0    1    ?    ?   : ? : 1;    //D=1 SE0
   r    ?    1     ?    1    ?    0    ?   : ? : 0;    //SD=0 SE1
   r    1    ?     ?    1    ?    1    ?   : ? : 1;    //SD=1 SE1
   n    1    1     ?    ?    ?    ?    ?   : ? : -;    // falling DC
   ?    (?1) 1     ?    ?    ?    ?    ?   : ? : -;    // reset inactive
   ?    1    (?1)  ?    ?    ?    ?    ?   : ? : -;    // set inactive
   ?    1    1     ?    ?    *    ?    ?   : ? : -;    // data change
   ?    1    1     ?    ?    ?    *    ?   : ? : -;    // Sdata change
   ?    1    1     ?    *    ?    ?    ?   : ? : -;    // SE change
   ?    1    1     *    ?    ?    ?    ?   : ? : -;    // E change bka
   (??) 1    1     0    0    ?    ?    ?   : ? : -;    // E change bka
   ?    1    0     ?    ?    ?    ?    ?   : ? : 1;    // set
   ?    0    1     ?    ?    ?    ?    ?   : ? : 0;    // reset 
   ?    x    ?     ?    ?    ?    ?    ?   : ? : x;    // reset x
   ?    ?    x     ?    ?    ?    ?    ?   : ? : x;    // set x
   ?    ?    ?     ?    ?    ?    ?    *   : ? : x;    // timing violation
      
endtable
endprimitive


// Description  : SCAN_JKFF with rising clock low clear low pre q and qb outputs    

primitive U_jkscp_Q(Q,C,RN,SN,SE,J,K,SD,notifier);

output Q;
reg    Q;
input  C,RN,SN,SE,J,K,SD,notifier;

table
// C    RN   SN   SE   J    K    SD   nfr : - : Q;
   r    1    1    0    1    0    ?    ?   : ? : 1;   //SE0 J1
   r    1    1    0    0    1    ?    ?   : ? : 0;   //SE0 k1
   r    1    1    0    1    1    ?    ?   : 0 : 1;   //SE0 JK1
   r    1    1    0    1    1    ?    ?   : 1 : 0;   //SE0 JK1
   r    1    1    1    ?    ?    1    ?   : ? : 1;   //SE1 SD1
   r    1    1    1    ?    ?    0    ?   : ? : 0;   //SE1 SD0
   ?    1    0    ?    ?    ?    ?    ?   : ? : 1;   //set
   ?    0    1    ?    ?    ?    ?    ?   : ? : 0;   //reset
   ?    0    0    ?    ?    ?    ?    ?   : ? : 0;   //reset + set
   n    1    1    ?    ?    ?    ?    ?   : ? : -;   //falling
   ?    (?1) 1    ?    ?    ?    ?    ?   : ? : -;   //res inactive
   ?    1    (?1) ?    ?    ?    ?    ?   : ? : -;   //set inactive
   ?    1    1    *    ?    ?    ?    ?   : ? : -;   //change SE
   ?    1    1    ?    *    ?    ?    ?   : ? : -;   //change J
   ?    1    1    ?    ?    *    ?    ?   : ? : -;   //change K
   ?    1    1    ?    ?    ?    *    ?   : ? : -;   //change SD
   (??) 1    1    0    0    0    ?    ?   : ? : -;   //SE0 JK0
   ?    x    ?    ?    ?    ?    ?    ?   : ? : x;   //reset x
   ?    ?    x    ?    ?    ?    ?    ?   : ? : x;   //set x
   ?    ?    ?    ?    ?    ?    ?    *   : ? : x;   //timing vio
endtable
endprimitive


// Description  : SCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfscp_Q(Q,C,RN,SN,SE,SD,notifier);

output Q;
reg    Q;
input  C,RN,SN,SE,SD,notifier;

table
// C    RN   SN   SE   SD   nfr : - : Q;
   r    1    1    0    ?    ?   : 0 : 1;   //toggle
   r    1    1    0    ?    ?   : 1 : 0;   //toggle
   ?    0    1    ?    ?    ?   : ? : 0;   //resn0
   ?    1    0    ?    ?    ?   : ? : 1;   //setn0
   ?    0    0    ?    ?    ?   : ? : 0;   //ressetn0
   r    1    1    1    0    ?   : ? : 0;   //se1 sd0
   r    1    1    1    1    ?   : ? : 1;   //se1 sd1
   n    1    1    ?    ?    ?   : ? : -;   //falling
   ?    (?1) 1    ?    ?    ?   : ? : -;   //resn inact
   ?    1    (?1) ?    ?    ?   : ? : -;   //setn inact
   ?    1    1    *    ?    ?   : ? : -;   //change se
   ?    1    1    ?    *    ?   : ? : -;   //cahnge sd
   ?    x    ?    ?    ?    ?   : ? : x;   //resnx
   ?    ?    x    ?    ?    ?   : ? : x;   //setnx
   ?    ?    ?    ?    ?    *   : ? : x;   //timing vio
endtable
endprimitive


// Description  : ESCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfsec_Q(Q,C,RN,T,SE,SD,notifier);

output Q;
reg    Q;
input  C,RN,T,SE,SD,notifier;

table
// C    RN   T   SE   SD   nfr : - : Q;
   r    1    1    0    ?    ?   : 0 : 1;   //toggle
   r    1    1    0    ?    ?   : 1 : 0;   //toggle
   r    1    0    0    ?    ?   : ? : -;   //t0 no toggle
   ?    0    ?    ?    ?    ?   : ? : 0;   //resn0
   r    1    ?    1    0    ?   : ? : 0;   //se1 sd0
   r    1    ?    1    1    ?   : ? : 1;   //se1 sd1
   n    1    ?    ?    ?    ?   : ? : -;   //falling
   ?    (?1) ?    ?    ?    ?   : ? : -;   //resn inact
   ?    1    *    ?    ?    ?   : ? : -;   //change t
   ?    1    ?    *    ?    ?   : ? : -;   //change se
   ?    1    ?    ?    *    ?   : ? : -;   //change sd
   ?    x    ?    ?    ?    ?   : ? : x;   //resnx
   ?    ?    ?    ?    ?    *   : ? : x;   //timing vio
endtable
endprimitive


// Description  : SCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfsecp_Q(Q,C,RN,SN,T,SE,SD,notifier);

output Q;
reg    Q;
input  C,RN,SN,T,SE,SD,notifier;

table
// C    RN   SN   T   SE   SD   nfr : - : Q;
   r    1    1    1   0    ?    ?   : 0 : 1;   //toggle
   r    1    1    1   0    ?    ?   : 1 : 0;   //toggle
   r    1    1    0   0    ?    ?   : ? : -;   //T0 notoggle
   ?    0    1    ?   ?    ?    ?   : ? : 0;   //resn0
   ?    1    0    ?   ?    ?    ?   : ? : 1;   //setn0
   ?    0    0    ?   ?    ?    ?   : ? : 0;   //ressetn0
   r    1    1    ?   1    0    ?   : ? : 0;   //se1 sd0
   r    1    1    ?   1    1    ?   : ? : 1;   //se1 sd1
   n    1    1    ?   ?    ?    ?   : ? : -;   //falling
   ?    (?1) 1    ?   ?    ?    ?   : ? : -;   //resn inact
   ?    1    (?1) ?   ?    ?    ?   : ? : -;   //setn inact
   ?    1    1    *   ?    ?    ?   : ? : -;   //change t
   ?    1    1    ?   *    ?    ?   : ? : -;   //change se
   ?    1    1    ?   ?    *    ?   : ? : -;   //change sd
   ?    x    ?    ?   ?    ?    ?   : ? : x;   //resnx
   ?    ?    x    ?   ?    ?    ?   : ? : x;   //setnx
   ?    ?    ?    ?   ?    ?    *   : ? : x;   //timing vio
endtable
endprimitive


// Description  : SCAN_TFF with rising clock low clear q and qb outputs

primitive U_tfsep_Q(Q,C,SN,T,SE,SD,notifier);

output Q;
reg    Q;
input  C,SN,T,SE,SD,notifier;

table
// C   SN   T   SE   SD   nfr : - : Q;
   r    1    1   0    ?    ?   : 0 : 1;   //toggle
   r    1    1   0    ?    ?   : 1 : 0;   //toggle
   r    1    0   0    ?    ?   : ? : -;   //T0 notoggle
   ?    0    ?   ?    ?    ?   : ? : 1;   //setn0
   r    1    ?   1    0    ?   : ? : 0;   //se1 sd0
   r    1    ?   1    1    ?   : ? : 1;   //se1 sd1
   n    1    ?   ?    ?    ?   : ? : -;   //falling
   ?   (?1)  ?   ?    ?    ?   : ? : -;   //setn inact
   ?    1    *   ?    ?    ?   : ? : -;   //change t
   ?    1    ?   *    ?    ?   : ? : -;   //change se
   ?    1    ?   ?    *    ?   : ? : -;   //change sd
   ?    x    ?   ?    ?    ?   : ? : x;   //setnx
   ?    ?    ?   ?    ?    *   : ? : x;   //timing vio
endtable
endprimitive
