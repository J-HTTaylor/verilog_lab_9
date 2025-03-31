`timescale 1ns / 1ps

module mem_mux(
    input [1:0] sel, 
    input[7:0] A, //00 
    input[7:0] B, //01 
    input[7:0] C, //10  
    input[7:0] D, //11 
    
    output [7:0] result
    );

    wire [8:0] result;
   assign result  = sel[1] ? (sel[0] ? D : C) : (sel[0] ? B : A);
    
endmodule

