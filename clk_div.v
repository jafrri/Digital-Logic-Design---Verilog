`timescale 1ns / 1ps
module clk_div(clk,clk_d);
    parameter div_value=1; // a constant value
    input clk;
    output clk_d;
    reg clk_d, count;
    initial 
        begin     clk_d=0; count=0;   end
    always @(posedge clk)
        begin // when count equal to div_value, it sets 
              // count equal to zero, else increment the 1 to it.
            if (count == div_value)  begin 
                 clk_d <= ~clk_d;
                 count <= 0; end
            else count <=count + 1;
        end
           
endmodule
