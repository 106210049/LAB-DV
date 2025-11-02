class scoreboard;
  int compare_cnt;
  mailbox mon_to_sb;
  int expected;

  function new(mailbox mon_to_sb);
    this.mon_to_sb = mon_to_sb;
    this.compare_cnt = 0;
  endfunction

  task run;
    forever begin
      transaction tr;
      mon_to_sb.get(tr);  // Nhận transaction từ monitor

      // Reference output trực tiếp trong SV
      expected = tr.ip1 + tr.ip2;

      // So sánh kết quả DUT với reference
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
