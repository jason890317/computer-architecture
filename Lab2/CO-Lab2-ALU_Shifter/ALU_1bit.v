module ALU_1bit( result, carryOut, a, b, invertA, invertB, aluOp, carryIn, less);
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire [1:0] aluOp;
  input wire less;
  input wire carryIn;
  
 ///////////////////////////////// Mux A and Mux B //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  assign wire_a = (invertA) ? ~a : a ;      // if invertA == 1 , not a
  assign wire_b = (invertB) ? ~b : b ;      // if invertB == 1, not b
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  

 ////////////////////////// the result of Adder , And, Or /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Full_adder full_adder( r_fulladder , carryOut , carryIn , wire_a , wire_b );   // call module "Full_adder" , put the result in r_fullader
  and and1( r_and , wire_a , wire_b );                                          // call gate " and " , put the result in r_and
  or or1( r_or , wire_a , wire_b );                                             // call gate " or " , put the result in r_or
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 


 /////////////////////// Mux of the result ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  assign result = ( aluOp == 2'b00) ? r_and :                   // if aluOp == 00 , reslut <--- r_and      
                     ( aluOp == 2'b01 ) ? r_or :                //  if aluOp == 01 , result <--- r_or 
                        ( aluOp == 2'b10 ) ? r_fulladder :      //  if aluOp == 10 , result <--- r_fulladder    
                           ( aluOp == 2'b11 ) ? less : 2'bxx ;  //  if aluOp == 11, result <--- less , else  result <--- x                                                                                                                
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 endmodule
