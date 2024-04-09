//
// An interface for the vend problem
//
interface name_intf(input reg Clk,input reg Reset);
    reg PushIn;
    reg FirstData;
    reg DinR;
    reg DinI;
    reg PushOut;
    reg DataOut;
    
    modport name(input Clk, input Reset, input PushIn, input FirstData,
        input DinR, input DinI, output PushOut, output DataOut);

endinterface : name_intf