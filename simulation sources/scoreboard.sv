class scoreboard;
  mailbox mon2scb;
  bit exp_q = 0;

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task main();
    transaction trans;
    repeat (4) begin
      mon2scb.get(trans);
      if (trans.q == exp_q)
        $display("Result is as Expected");
      else
        $error("Wrong Result");

      exp_q = trans.rst ? 1'b0 : trans.d;
      trans.display("Scoreboard");
    end
  endtask
endclass


