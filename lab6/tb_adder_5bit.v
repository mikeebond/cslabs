module tb_adder_5bit;

    // Signal declarations to connect to the adder
    reg [4:0] a;
    reg [4:0] b;
    reg cin;
    wire [4:0] sum;
    wire cout;

    // Signals for the Reference model
    reg [5:0] expected_result;
    wire [5:0] actual_result;

    // Combine adder outputs for convenient comparison
    assign actual_result = {cout, sum};

    // Device Under Test (DUT) instantiation
    adder_5bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Simulation block (Stimulus and Reference model)
    initial begin
        $display("Starting 5-bit adder simulation");
        $display("A \t B \t Cin \t| Sum \t Cout \t| Expected \t| Status");
        $display("-------------------------------------------------------------------------");

        // Generation of 20 random test vectors (Stimulus)
        repeat (20) begin
            // 1. STIMULUS: Applying input values
            a = $urandom_range(0, 31);   // Random number from 0 to 31 (5 bits)
            b = $urandom_range(0, 31);
            cin = $urandom_range(0, 1);  // Random carry-in (0 or 1)

            // Time delay for signal stabilization (propagation through logic)
            #10;

            // 2. REFERENCE MODEL: Calculating the expected result using a math function
            expected_result = a + b + cin;

            // 3. CHECK AND ANALYSIS: Comparing the device result with the reference model
            if (actual_result == expected_result) begin
                $display("%d \t %d \t %d \t| %d \t %d \t| %d \t\t| PASS", a, b, cin, sum, cout, expected_result);
            end else begin
                $display("%d \t %d \t %d \t| %d \t %d \t| %d \t\t| FAIL", a, b, cin, sum, cout, expected_result);
            end
        end

        $display("-------------------------------------------------------------------------");
        $display("Simulation finished.");
        $finish; // Stop simulation
    end

endmodule