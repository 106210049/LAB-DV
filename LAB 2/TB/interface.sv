interface add_if(input logic clk, rst_n);
  logic [7:0] ip1, ip2;
  logic [8:0] out;
  
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
  endclocking
 
endinterface