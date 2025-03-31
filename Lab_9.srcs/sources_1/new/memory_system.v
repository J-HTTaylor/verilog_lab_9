`timescale 1ns / 1ps

module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

   wire enable_A, enable_B, enable_C, enable_D; //used to wire output of enable to correct byte bus
    
    enable_demux enable_init(
        .enable_sig(store), 
        .de_sel(addr[1:0]),
        .A(enable_A),
        .B(enable_B),
        .C(enable_C),
        .D(enable_D)

    );
    
    wire [7:0]data_A; 
    wire [7:0]data_B;
    wire [7:0]data_C; 
    wire [7:0]data_D; // wire the 8-bit variables across
 
    data_demux data_init(
    .data(data),
    .de_sel(addr[1:0]),
    .A(data_A),
    .B(data_B),
    .C(data_C),
    .D(data_D)
    );
    
    
  wire [7:0]mem_A; 
    wire [7:0]mem_B;
    wire [7:0]mem_C; 
    wire [7:0]mem_D;; //used for wiring data held to mux
 
     byte_mem mem_init_A(
        .data(data_A),
        .store(enable_A),
        .memory(mem_A)
     );
     
    byte_mem mem_init_B(
        .data(data_B),
        .store(enable_B),
        .memory(mem_B)
     );
     
     byte_mem mem_init_C(
        .data(data_C),
        .store(enable_C),
        .memory(mem_C)
     );
     
     byte_mem mem_init_D(
        .data(data_D),
        .store(enable_D),
        .memory(mem_D)
     );
     
     mem_mux mem_mux_init(
     .sel(addr[1:0]),
     .A(mem_A),
     .B(mem_B),
     .C(mem_C),
     .D(mem_D),
     .result(memory)
     );
endmodule
