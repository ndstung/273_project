`timescale 1us/1ns
`include "package.sv"

import uvm_pkg::*;
//import hw06_monitor::*; 

//include "./directory/to/file.shv"

module top();
    reg clk,rst;
    //name_intf namex(clk,rst)
    
    initial begin
        clk = 0;
        rst = 1;
    end

    initial begin
		uvm_config_db #(virtual vend_intf)::set(null, "*", "my_interface" , vendx);
		run_test("my_test");
	end

endmodule : top