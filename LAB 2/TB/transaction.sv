class transaction;
  rand bit [7:0] ip1, ip2;
  bit [8:0] out;
   
  constraint ip_c {ip1 < 100; ip2 < 100;}
 
endclass