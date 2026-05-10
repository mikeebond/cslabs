`timescale 1ns/1ps

module tb_ALB;
    reg [3:0] R, S;
    reg CI;
    reg [2:0] H;
    reg [1:0] I;
    wire [3:0] Y, Y_norm;
    wire CO, VO, NO, ZO;

    // ??????????? ?????? ????????? ??????
    ALB uut (
        .R(R), .S(S), .CI(CI), .H(H), .I(I),
        .Y(Y), .Y_norm(Y_norm),
        .CO(CO), .VO(VO), .NO(NO), .ZO(ZO)
    );

    initial begin
        $display("=== Mega ALB Test Start ===");
        H = 3'b110; // ??? ????????
        CI = 1;

        // ???? 1: OR (I=00)
        R = 4'b0101; S = 4'b0011; I = 2'b00; #10;
        $display("[00] OR   R=%b S=%b => Y=%b, Y_norm=%b | CO=%b VO=%b NO=%b ZO=%b", R, S, Y, Y_norm, CO, VO, NO, ZO);

        // ???? 2: XOR (I=01)
        R = 4'b1101; S = 4'b0111; I = 2'b01; #10;
        $display("[01] XOR  R=%b S=%b => Y=%b, Y_norm=%b | CO=%b VO=%b NO=%b ZO=%b", R, S, Y, Y_norm, CO, VO, NO, ZO);

        // ???? 3: SUB (I=10)
        R = 4'b0010; S = 4'b1000; I = 2'b10; #10;
        $display("[10] SUB  S=%b R=%b => Y=%b, Y_norm=%b | CO=%b VO=%b NO=%b ZO=%b", S, R, Y, Y_norm, CO, VO, NO, ZO);

        // ???? 4: ADD (I=11)
        R = 4'b0110; S = 4'b0011; I = 2'b11; #10;
        $display("[11] ADD  R=%b S=%b => Y=%b, Y_norm=%b | CO=%b VO=%b NO=%b ZO=%b", R, S, Y, Y_norm, CO, VO, NO, ZO);

        $stop;
    end
endmodule
