class my_sequence extends uvm_sequence;
	`uvm_object_utils(my_sequence)

	function new(string name = "my_sequence");
		super.new(name);
	endfunction
	
	my_sequence_item seq_itm;
	
	virtual task body();
      `uvm_info("SEQUENCE","TASK", UVM_MEDIUM);
	    seq_itm = my_sequence_item::type_id::create("seq_itm"); 
		
        repeat(1)
		begin
		    $display("Starting Sequence");
            
            start_item(seq_itm);
            seq_itm.randomize() with {PushIn == 0; FirstGata == 0; DinR==0; DinI==0; PushOut==0; DataOut==0;};
            finish_item(seq_itm);
            
        end
	endtask


endclass : my_sequence