`timescale 1ns / 1ps


module enable_demux(
    input enable_sig,
    input [1:0] de_sel,
    
    output reg A,
    output reg B,
    output reg C,
    output reg D
    );
    
    
    //demux turned on
    always @ (*)begin
        case(de_sel)
        0 :begin 
                 A = enable_sig;
                 B = 0;
                 C = 0;
                 D = 0;             
        end
        1 : begin 
                 A = 0;
                 B = enable_sig;
                 C = 0;
                 D = 0;              
        end
        2 :  begin  
                 A = 0;
                 B = 0;
                 C = enable_sig;
                 D = 0;  
        end
        3 :  begin 
                 A = 0;
                 B = 0;
                 C = 0;
                 D = enable_sig;            
        end
        default:  begin 
            A = 0;
                 B = 0;
                 C = 0;
                 D = 0;           
        end
        endcase
        end

endmodule
