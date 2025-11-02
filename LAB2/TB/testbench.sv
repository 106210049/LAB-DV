`include "interface.sv"
`include "base_test.sv"

module tb_top;
  bit clk;
  bit rst_n;
  always #2 clk = ~clk;
  
  add_if vif(clk, rst_n);
  adder DUT(.clk(vif.clk),.rst_n(vif.rst_n),.in1(vif.ip1),.in2(vif.ip2),.out(vif.out));
  base_test t1(vif);
  
  initial begin
    clk = 0;
    rst_n = 0;
    #5; 
    rst_n = 1;
  end
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule