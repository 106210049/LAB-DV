class monitor;
  mailbox mon_to_sb;
  virtual add_if vif;
  
  function new (mailbox mon_to_sb, virtual add_if vif);
    this.mon_to_sb = mon_to_sb;
    this.vif = vif;
  endfunction
  
  task run;
    forever begin
      transaction mon_tr;
      wait(vif.rst_n);
      @(posedge vif.clk);
      mon_tr = new();
      mon_tr.ip1 = vif.ip1;
      mon_tr.ip2 = vif.ip2;
      @(posedge vif.clk);
      mon_tr.out = vif.out;
      
      mon_to_sb.put(mon_tr);
    end
  endtask
endclass

      