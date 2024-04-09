class my_driver extends uvm_driver #(my_sequence_item);
	`uvm_component_utils(my_driver)

	function new(string name = "my_driver", uvm_component parent = null);
		super.new(name, parent);
	endfunction

	// Instantiate Interface, Sequence Item. 
	virtual vend_intf intf;	
    my_sequence_item seq_itm;
	
    function void build_phase(uvm_phase phase);
		super.build_phase (phase);
		if (!uvm_config_db#(virtual vend_intf)::get(this, "*", "my_interface", intf))
		begin	
			`uvm_fatal("DRIVER", "Could not get virtual interface") 
		end
	endfunction

	task run_phase (uvm_phase phase);
		super.run_phase(phase);
		`uvm_info("DRIVER","RUN PHASE", UVM_MEDIUM);

        // DESIGN BUG ???
        forever begin
	    @(posedge intf.clk);	
            
            seq_item_port.get_next_item(seq_itm);
            
            #10 drive_reset(seq_item); //reset all values 

            // CODE HERE
            
            seq_item_port.item_done();

		end
	endtask : run_phase

        
        virtual task drive_reset(my_sequence_item seq_itm);
            //reset all values to zeros
            intf.PushIn = 0;
            intf.FirstData = 0;
            intf.DinR = 0;
            intf.DinI = 0;
            intf.PushOut = 0;
            intf.DataOut = 0;
        endtask: drive_reset

endclass : my_driver