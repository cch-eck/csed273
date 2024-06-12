`timescale 1ns / 1ps

module lab4_fpga(
    input clk,
    input btnCenter, btnTop, btnBottom, btnLeft, btnRight,
    input [0:15] sw, // Switches
    output reg [0:3] ssSel, // 7seg Selector
    output reg [0:7] ssDisp, // 7seg Display
    output reg [0:15] led
    );

    reg [4:0] A_add;
    reg [4:0] B_add;
    wire CARRY_add;
    wire [4:0] OUT_add;
    
    reg [4:0] A_sub;
    reg [4:0] B_sub;
    wire CARRY_sub;
    wire [4:0] OUT_sub;
    
    reg [4:0] A_mul;
    reg [2:0] B_mul;
    wire [7:0] OUT_mul;

    lab4_2 ripple_adder(
      .in_a(A_add),
      .in_b(B_add),
      .in_c(1'b0),
      .out_s(OUT_add),
      .out_c(CARRY_add)
   );

   lab4_3 ripple_subtractor(
      .in_a(A_sub),
      .in_b(B_sub),
      .in_c(1'b1),
      .out_s(OUT_sub),
      .out_c(CARRY_sub)
   );
   
    lab4_4 multiplier(
      .in_a(A_mul),
      .in_b(B_mul),
      .out_m(OUT_mul)
    );

    // LED Display Update
    always @(posedge clk) begin

        led[0:4] = sw[0:4];
        led[5:7] = sw[5:7];

        A_mul = sw[0:4];
        B_mul = sw[5:7];
        
        led[8:15] = OUT_mul;
        
    end
    
endmodule