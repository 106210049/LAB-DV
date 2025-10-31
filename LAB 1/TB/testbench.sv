// Code your testbench here
// or browse Examples
interface fa_if;
  logic a, b, c;
  logic s_out, c_out;
  
  modport TB (output s_out, c_out, input a,b,c);
  modport RTL (output s_out, c_out, input a,b,c);
endinterface

`include "test.sv"

module tb_top;
  fa_if inf();	// Interface
  full_adder fa(inf.RTL); //DUT
  test t(inf);	// Test program(test.sv)
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule