`timescale 1ns / 1ps

module byte_mem(
    input [7:0] data,
    input store,
    output [7:0] memory
);

    genvar i; 
    generate 
        for (i = 0; i < 8; i = i + 1) begin  //creates 8 1-bit D-latchs in a bus
             Dlatch Dlatch_init(
            .Data(data[i]), //uses each individual bit of the 8-bit input
            .Enable(store),
            .Q(memory[i]), //stores the chosen value as memory for each bit selected
         .notQ()
    );
        end
    endgenerate
endmodule
