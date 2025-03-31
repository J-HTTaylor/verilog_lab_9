`timescale 1ns / 1ps

module data_demux(
    input [7:0] data,
    input [1:0] de_sel,
    
    output reg [7:0]A,
    output reg [7:0]B,
    output reg [7:0]C,
    output reg [7:0]D
    );
    
    
    //demux turned on
    always @ (*)begin
        case(de_sel)
        0 :begin 
                 A = data;
                 B = 8'b0;
                 C = 8'b0;
                 D = 8'b0;             
        end
        1 : begin 
                 A = 8'b0;
                 B = data;
                 C = 8'b00;
                 D = 8'b0;              
        end
        2 :  begin  
                 A = 8'b00;
                 B = 8'b0;
                 C = data;
                 D = 8'b0;  
        end
        3 :  begin 
                 A = 8'b0;
                 B = 8'b00;
                 C = 8'b00;
                 D = data;            
        end
        default:  begin 
                 A = 8'b0;
                 B = 8'b00;
                 C = 8'b0;
                 D = 8'b0;           
        end
        endcase
        end

endmodule
