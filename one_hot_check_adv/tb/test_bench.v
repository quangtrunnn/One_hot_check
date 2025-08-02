`timescale 1ns/1ns

module test_bench;
    //--- variable declaration

	parameter N=8;

	reg[N-1:0] sig_in;
	reg en;
	wire one_hot;
    //--- dut instatiation

	one_hot_check #(.N(N) dut(
				.sig_in(sig_in),
				.en(en),
				.one_hot(one_hot)
			);

    //remember to override the dut with N parameter

	function is_one_hot;
		input [N-1:0] value;
		begin
			is_one_hot = (value !=0)&&((value &(value-1))==0);
		end
	endfunction

	task test;
		input [N-1:0] in_val;
		input en_val;
		reg exp;
		begin
			sig_in=in_val;
			en=en_val;
			exp= en_val && is_one_hot(in_val);

		#5;
		if(one_hot != exp)
			$display("FAILED, sig_in=%b, en=%b, one hot=%b, Expected = %b",sig_in,en, one_hot, exp);
		else
			$display("PASSED: sig_in=%b , en=%b, one hot=%b, Expected = %b",sig_in, en,one_hot,exp);
			end
	endtask
		
	integer i;
    initial begin
        //--- variable initialization

	$display("--------------------TESTING ONE_HOT_CHECK with N = %d -----------------------------",N);

	for(i=0; i<(1<<N); i=i+1)begin
	test(i[N-1:0],1);
	end

	$display("\n ----TEsting with en =0 ---");
	test(1<<i,0);
	end
	$display("------DONE------");

       
        $finish;

    end


endmodule
