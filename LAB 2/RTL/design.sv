// Code your design here
module adder(input clk, rst_n, input [7:0] in1, in2, output reg [8:0] out);
  always@(posedge clk or negedge rst_n) begin 
    if(!rst_n) out <= 0;
    else out <= in1 + in2;
  end
endmodule