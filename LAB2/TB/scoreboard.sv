class scoreboard;
  int compare_cnt;
  mailbox mon_to_sb;
  int expected;

  // Import hàm DPI t? C
  

  function new(mailbox mon_to_sb);
    this.mon_to_sb = mon_to_sb;
    this.compare_cnt = 0;
  endfunction

  task run;
    transaction tr;

    forever begin
      mon_to_sb.get(tr);  // Nh?n transaction t? monitor

      // G?i hàm reference model b?ng DPI
      expected = golden_add_model(tr.ip1, tr.ip2);

      // So sánh k?t qu? DUT v?i model
      if (expected == tr.out) begin
        $display("[SCOREBOARD] MATCHED: ip1=%0d, ip2=%0d, out=%0d", 
                 tr.ip1, tr.ip2, tr.out);
      end else begin
        $display("[SCOREBOARD] MISMATCH: ip1=%0d, ip2=%0d, out=%0d (Expected=%0d)", 
                 tr.ip1, tr.ip2, tr.out, expected);
      end

      compare_cnt++;
    end
  endtask
endclass

