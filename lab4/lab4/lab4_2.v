/* CSED273 lab4 experiment 2 */
/* lab4_2.v */

/* Implement 5-Bit Ripple Adder
 * You must use fullAdder module in lab4_1.v
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling */
module lab4_2(
    input [4:0] in_a,
    input [4:0] in_b,
    input in_c,
    output [4:0] out_s,
    output out_c
    );

    ////////////////////////
    assign in_c = 0;
    wire [5:1] carry;

    fullAdder FA1(
        .in_a(in_a[0]),
        .in_b(in_b[0]),
        .in_c(in_c),
        .out_s(out_s[0]),
        .out_c(carry[1])
    );
    
    fullAdder FA2(
        .in_a(in_a[1]),
        .in_b(in_b[1]),
        .in_c(carry[1]),
        .out_s(out_s[1]),
        .out_c(carry[2])
    );
    
    fullAdder FA3(
        .in_a(in_a[2]),
        .in_b(in_b[2]),
        .in_c(carry[2]),
        .out_s(out_s[2]),
        .out_c(carry[3])
    );
    
    fullAdder FA4(
        .in_a(in_a[3]),
        .in_b(in_b[3]),
        .in_c(carry[3]),
        .out_s(out_s[3]),
        .out_c(carry[4])
    );
    
    fullAdder FA5(
        .in_a(in_a[4]),
        .in_b(in_b[4]),
        .in_c(carry[4]),
        .out_s(out_s[4]),
        .out_c(carry[5])
    );
    
    assign out_c = carry[5];

    ////////////////////////

endmodule