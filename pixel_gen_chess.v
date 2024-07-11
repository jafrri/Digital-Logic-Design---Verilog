`timescale 1ns / 1ps
module pixel_gen_chess(
    input clk_d, //This clock is of 25MHz
    input video_on,// video_on tells us operating region
    input [9:0] pixel_x,pixel_y,
    output reg [3:0] red=0,green=0,blue=0);
localparam WHITE= 12'h002D;
localparam BLACK= 12'h0000;

always @(posedge clk_d)
begin
    if (  (((pixel_x==0)|(pixel_x>479)) & ((pixel_y==0)|(pixel_y>479))) | (~video_on) )
        begin   red <=4'h0; green <=4'h0; blue <=4'h0; end
        
    else
  begin 
        if (( (pixel_x>0 & pixel_x<60)|(pixel_x>=120 & pixel_x<180)|(pixel_x>=240 & pixel_x<300)|(pixel_x>=360 & pixel_x<420) ) & 
            ( (pixel_y>0 & pixel_y<60)|(pixel_y>=120 & pixel_y<180)|(pixel_y>=240 & pixel_y<300)|(pixel_y>=360 & pixel_y<420)) & video_on)
            begin   red <=4'h0; green <=4'h0; blue <=4'h0; end 
        else 
            begin  red <=4'hF; green <=4'hF; blue <=4'hF; end
            
        if (( (pixel_x>=60 & pixel_x<120)|(pixel_x>=180 & pixel_x<240)|(pixel_x>=300 & pixel_x<360)|(pixel_x>=420 & pixel_x<480) ) & 
            ( (pixel_y>=60 & pixel_y<120)|(pixel_y>=180 & pixel_y<240)|(pixel_y>=300 & pixel_y<360)|(pixel_y>=420 & pixel_y<480) )& video_on)
            begin   red <=4'h0; green <=4'h0; blue <=4'h0; end 
        else 
            begin  red <=4'hF; green <=4'hF; blue <=4'hF; end
    end 
    
end
endmodule
