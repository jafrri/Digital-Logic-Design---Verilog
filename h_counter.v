`timescale 1ns / 1ps
module h_counter(clk,h_count,trig_v);
    input clk;
    output [9:0] h_count;
    output trig_v;              //rig_v is set to 1 when counter resets. 
    reg [9:0] h_count;          // trig_v would be zero if count is greater than 1 after reset
    reg trig_v;
    initial h_count= 10'b0;
    initial trig_v= 1'b0;
always @(posedge clk)
    begin 
        if(h_count < 799)
            begin  h_count <= h_count +1; 
            trig_v=0; end
        else
            begin  h_count =0; trig_v=1'b1; end
        
    end    
endmodule

