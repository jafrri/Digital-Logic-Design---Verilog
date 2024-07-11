`timescale 1ns / 1ps
module vga_sync(
    input [9:0] h_count, v_count,
    output h_sync, v_sync, video_on,// video_on tells us operating region
    output [9:0] x_loc, y_loc); //(x,y) coordinate in frame
    //HORIZONTAL COUNTER
    localparam HD = 640 ;  //Horizontal Display area
    localparam HF = 16 ;   //Horizontal Front Porch
    localparam HB = 48 ;   //Horizontal Back Porch
    localparam HR = 96 ;   //Horizontal Retrace
    localparam HMAX = HD+HF+HB+HR-1; //max value of horizontal counter = 799
    // VERTICAL COUNTER
    localparam VD = 480 ;  //Vertical Display area
    localparam VF = 10 ;   //Vertical Front Porch
    localparam VB = 33 ;   //Vertical Back Porch
    localparam VR = 2 ;    //Vertical Retrace    
    localparam VMAX = VD+VF+VB+VR-1; // max value of vertical counter = 524  
    // Counter wire for Output 
    wire v_sync_reg, h_sync_reg; 
    assign h_sync_reg = ((HD + HF) <= h_count) && (h_count < (HD + HF + HR)); // Asserted from 656 to 751.
    assign v_sync_reg = ((VD + VF) <= v_count) && (v_count < (VD + VF + VR)); // Asserted from 490 to 491. 
    // Video ON/OFF - only ON while pixel counts are within the display area
    assign video_on = ((h_count < HD) && (v_count < VD)); // 0-639 and 0-479 respectively
    // Outputs
    assign h_sync  = ~h_sync_reg;
    assign v_sync  = ~v_sync_reg;
    assign x_loc  = h_count;
    assign y_loc  = v_count;
endmodule
