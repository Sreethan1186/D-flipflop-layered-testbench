class monitor;
  virtual intf vif;
  mailbox mon2scb;

  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main();
    repeat (4) begin
      @(posedge vif.clk);
      #3;
      begin
        transaction trans;
        trans = new();
        trans.d   = vif.d;
        trans.rst = vif.rst;
        trans.q   = vif.q;
        mon2scb.put(trans);
        trans.display("Monitor");
      end
    end
  endtask
endclass


