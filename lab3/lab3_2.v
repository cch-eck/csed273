/* CSED273 lab3 experiment 2 */
/* lab3_2.v */


/* Implement Prime Number Indicator & Multiplier Indicator
 * You may use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
 
/* 11: out_mul[4], 7: out_mul[3], 5: out_mul[2],
 * 3: out_mul[1], 2: out_mul[0] */
module lab3_2(
    input wire [3:0] in,
    output wire out_prime,
    output wire [4:0] out_mul
    );

    ////////////////////////    
    assign out_prime = (in == 4'b0010) | (in == 4'b0011) | 
                       (in == 4'b0101) | (in == 4'b0111) |
                       (in == 4'b1011) | (in == 4'b1101);
    assign out_mul[0] = (in == 4'b0010) | (in == 4'b0100) | (in == 4'b0110) | (in == 4'b1000) | (in == 4'b1010) | (in == 4'b1100) | (in == 4'b1110);
    assign out_mul[1] = (in == 4'b0011) | (in == 4'b0110) | (in == 4'b1001) | (in == 4'b1100);
    assign out_mul[2] = (in == 4'b0101);
    assign out_mul[3] = (in == 4'b0111);
    assign out_mul[4] = (in == 4'b1011);
    ////////////////////////

endmodule