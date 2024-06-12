/* CSED273 lab4 experiment 4 */
/* lab4_4.v */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling */
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    wire [4:0] partial1, partial2, partial4;
    wire [5:0] partial3;
    
    assign out_m[0] = in_a[0] & in_b[0];
    assign partial1[0] = in_a[1] & in_b[0];
    assign partial1[1] = in_a[2] & in_b[0];
    assign partial1[2] = in_a[3] & in_b[0];
    assign partial1[3] = in_a[4] & in_b[0];
    assign partial1[4] = 0;
    
    assign partial2[0] = in_a[0] & in_b[1];
    assign partial2[1] = in_a[1] & in_b[1];
    assign partial2[2] = in_a[2] & in_b[1];
    assign partial2[3] = in_a[3] & in_b[1];
    assign partial2[4] = in_a[4] & in_b[1];
    
    lab4_2 Adder1(
        .in_a(partial1[4:0]),
        .in_b(partial2[4:0]),
        .in_c(0),
        .out_s(partial3[4:0]),
        .out_c(partial3[5])
    );
    
    assign out_m[1] = partial3[0];
    assign partial4[0] = in_a[0] & in_b[2];
    assign partial4[1] = in_a[1] & in_b[2];
    assign partial4[2] = in_a[2] & in_b[2];
    assign partial4[3] = in_a[3] & in_b[2];
    assign partial4[4] = in_a[4] & in_b[2];
    
    lab4_2 Adder2(
        .in_a(partial3[5:1]),
        .in_b(partial4[4:0]),
        .in_c(0),
        .out_s(out_m[6:2]),
        .out_c(out_m[7])
    );
    ////////////////////////
    
endmodule