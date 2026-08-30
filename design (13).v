`timescale 1ns/1ps

module half_subtractor(
    input A, B,
    output Diff, Borrow
);
    xor(Diff, A, B);
    and(Borrow, ~A, B);
endmodule

module full_subtractor(
    input A, B, Bin,
    output Diff, Bout
);
    wire D1, B1, B2;

    half_subtractor HS1(A, B, D1, B1);
    half_subtractor HS2(D1, Bin, Diff, B2);

    or(Bout, B1, B2);
endmodule
