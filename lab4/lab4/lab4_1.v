/* CSED273 lab4 experiment 1 */
/* lab4_1.v */

/* Implement Half Adder
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling */
module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );
    ///
    xor(out_s, in_a, in_b);
    and(out_c, in_a, in_b);
    ///
    
endmodule

/* Implement Full Adder
 * You must use halfAdder module
 * You may use keword "assign" and bitwise opeartor
 * or just implement with gate-level modeling */
module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );

    ///
    wire w1, w2, w3;

    halfAdder HA1(
        .in_a(in_a),
        .in_b(in_b),
        .out_s(w1),
        .out_c(w2)
    );
    
    halfAdder HA2(
        .in_a(w1),
        .in_b(in_c),
        .out_s(out_s),
        .out_c(w3)
    );
    
    assign out_c = w2 | w3;
    ///

endmodule