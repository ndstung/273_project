class my_agent extends uvm_agent;
	`uvm_component_utils(my_agent)
	
	function new (string name, uvm_component parent=null);
		super.new(name, parent);
	endfunction
	
	// Analysis port
	uvm_analysis_port #(my_sequence_item) agent_port;

	//Instantiate Driver, Sequencer, Monitor
	my_driver drv;
	my_sequencer sqr;
	my_monitor mon;
	
	function void build_phase (uvm_phase phase);
		drv = my_driver::type_id::create("DRIVER",this);
		sqr = my_sequencer::type_id::create("SEQUENCER",this);
		mon = my_monitor::type_id::create("MONITOR",this);	
		agent_port = new("agent_port",this);
	endfunction

    // connect phase
    // connect driver and sequencer
	function void connect_phase(uvm_phase phase); 
		drv.seq_item_port.connect(sqr.seq_item_export);
	endfunction

endclass : my_agent