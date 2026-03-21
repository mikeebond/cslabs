module adder_5bit (
    input [4:0] a,      // 1st 5-bit addend
    input [4:0] b,      // 2nd 5-bit addend
    input cin,          // Carry-in
    output [4:0] sum,   // 5-bit sum
    output cout         // Carry-out
);
    // Perform addition. Concatenation {cout, sum} forms a 6-bit result
    assign {cout, sum} = a + b + cin;
endmodule