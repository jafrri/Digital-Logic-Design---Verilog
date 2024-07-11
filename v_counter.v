`timescale 1ns / 1ps
module v_counter(clk,enable_v,v_count);
    input clk,enable_v;
    output [9:0] v_count;
    reg [9:0] v_count;
    initial v_count = 10'h0;
always @(posedge clk)
    begin
        if (enable_v & (v_count < 524))
            v_count <= v_count + 1;    
        else if (enable_v)
            v_count <= 0;        
    end
endmodule
