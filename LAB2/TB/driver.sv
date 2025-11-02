class driver;
  virtual add_if vif;
  mailbox gen_to_drv;
  transaction tr;
  
  function new(mailbox gen_to_drv, virtual add_if vif);
    this.gen_to_drv = gen_to_drv;
    this.vif = vif;
  endfunction
  
  task run;
    forever begin
      // Driver to the DUT
      @(posedge vif.clk);
      gen_to_drv.get(tr);
      //$display("ip1 = %0d, ip2 = %0d", tr.ip1, tr.ip2);
      vif.ip1 <= tr.ip1;
      vif.ip2 <= tr.ip2;
      @(posedge vif.clk);
      tr.out <= vif.out;
    end
  endtask
endclass