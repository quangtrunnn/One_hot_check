`timescale 1ns/1ns

module test_bench;
    //--- variable declaration
	reg [3:0] sig_in;
	reg en;
	wire one_hot;
    //--- dut instatiation
	one_hot_check dut(
		.sig_in(sig_in),
		.en(en),
		.one_hot(one_hot)
	);
	task test(input[3:0] in, input en_val, input exp);
		begin
			sig_in=in;
			en_val=en;
			#5;
			if(one_hot != exp)
				$display("FAILED, sig_in=%b, en=%b, one hot=%b, Expected = %b",in,en_val, one_hot, exp);
			else
				$display("PASSED: sig_in=%b , en=%b, one hot=%b, Expected = %b",in, en_val,one_hot,exp);
			end
	endtask
    initial begin
        //--- variable initialization
	$display("--------------------TESTING ONE_HOT_CHECK-----------------------------");
	test(4'b0001,1,1);
	test(4'b0010,1,1);
	test(4'b0100,1,1);
	test(4'b1000,1,1);
	test(4'b0000,1,0);
	test(4'b0011,1,0);
	test(4'b1111,1,0);
	test(4'b0100,0,0);
	test(4'b0000,0,0);
	test(4'b1111,0,0);
	$display("------DONE------");
        //--- write you code here
        //--- end simulation
        #100;
        $finish;

    end
endmodule
