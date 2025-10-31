program test (fa_if inf);
  class drive;
    randc bit a, b, c;          // random từng bit
    virtual fa_if vif;
    
    function new (virtual fa_if inf);
      this.vif = inf;
    endfunction
    
    // Task để gửi giá trị đến DUT
    task drive_inputs();
      vif.a = a;
      vif.b = b;
      vif.c = c;
      #10;
    endtask
    
   task monitor_signals();
     $monitor("time=%0t | a=%b b=%b c=%b | sum=%b carry=%b", $time, vif.a, vif.b, vif.c, vif.s_out, vif.c_out);
  endtask
    
  endclass
  
  initial begin
    drive drv = new(inf);
    
    $display("=== Simulation start ===");
    repeat(8) begin
      assert(drv.randomize());
      drv.drive_inputs(); // drive inputs signals
      drv.monitor_signals(); // monitor signals
    end

    #10 $finish;
  end
endprogram
