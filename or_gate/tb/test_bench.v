`timescale 1ns/1ns
module test_bench;
    //signal declaration
	reg tb_a,tb_b;
	wire tb_z;
    
    //module instatiation
	or_gate u_dut(
		.a(tb_a), 
		.b(tb_b), 
		.z(tb_z)
	);

    //main program
	initial begin
		tb_a=0;
		tb_b=0;
		#10;
		$display("Case 1: a=%b, b=%b", tb_a,tb_b);

		if(tb_z===0) begin
			$display("PASSED");
		end else begin
			$display("FAILDED, EXP: 0 Actual %b", tb_z);
		end


		tb_a=0;
		tb_b=1;
		#10;
		$display("Case 2: a=%b, b=%b", tb_a,tb_b);

		if(tb_z===1) begin
			$display("PASSED");
		end else begin
			$display("FAILDED, EXP: 1 Actual %b", tb_z);
		end

		tb_a=1;
		tb_b=0;
		#10;
		$display("Case 3: a=%b, b=%b", tb_a,tb_b);

		if(tb_z===1) begin
			$display("PASSED");
		end else begin
			$display("FAILDED, EXP: 1 Actual %b", tb_z);
		end

		tb_a=1;
		tb_b=1;
		#10;
		$display("Case 4: a=%b, b=%b", tb_a,tb_b);

		if(tb_z===1) begin
			$display("PASSED");
		end else begin
			$display("FAILDED, EXP: 1 Actual %b", tb_z);
		end

		#10;
		$finish;
	end
endmodule
