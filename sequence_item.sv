class my_sequence_item extends uvm_sequence_item;  
    // `uvm_object_utils(my_sequence_item)
            
        rand reg PushIn;        //Data is present on the input
        rand reg FirstData;     //The first Data in an FFT block

        rand reg [15:0] DinR;   //Real part of input 
        rand reg [15:0] DinI;   //Imaginary part of input 

        reg PushOut;            //Data is present on the output
        reg [47:0] DataOut ;    //Output data bits
    
        function new(string name = "my_sequence_item");
            super.new(name);
        endfunction

        `uvm_object_utils_begin(my_sequence_item)
            `uvm_field_int(PushIn, UVM_ALL_ON)
            `uvm_field_int(FirstGata, UVM_ALL_ON)
            `uvm_field_int(DinR, UVM_ALL_ON)
            `uvm_field_int(DinI, UVM_ALL_ON)
            `uvm_field_int(PushOut, UVM_ALL_ON)
            `uvm_field_int(DataOut, UVM_ALL_ON)
        `uvm_object_utils_end
    
        function display();
            $display("");
        endfunction: display
    
    endclass : my_sequence_item