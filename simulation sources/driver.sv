class driver;
  virtual intf vif; // vif is a handle of virtual interface
  mailbox gen2driv;

  function new(virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction

  task main();
    repeat (4) begin
      transaction trans;
      gen2driv.get(trans);

      @(posedge vif.clk);
      vif.d   <= trans.d;
      vif.rst <= trans.rst;

      #1;
      trans.q = vif.q;
      trans.display("Driver");
    end
  endtask
endclass


