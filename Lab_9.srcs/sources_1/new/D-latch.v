`timescale 1ns / 1ps


module Dlatch(
    input Data,
    input Enable,
    output reg Q,
    output notQ
    );

    always @ (Data, Enable) begin //on data or enable change this begin
        if(Enable)
            Q <= Data;
     end
        assign notQ = ~Q; //this doesnt cause problems as until Q is called for the first time it is a invalid state
          
endmodule
