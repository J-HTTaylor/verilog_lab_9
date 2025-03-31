`timescale 1ns / 1ps

module top(
       input [15:0]sw,
       input btnC,
       output [15:0] led
    );
    
    Dlatch Dlatch_init(
        .Data(sw[0]),
        .Enable(btnC),
        .Q(led[0]),
        .notQ(led[1])
    );
    //call the memory system here
   
   memory_system system_init(
    .data(sw[15:8]),
    .store(btnC),
    .addr(sw[7:6]),
    .memory(led[15:8])
   );
endmodule
