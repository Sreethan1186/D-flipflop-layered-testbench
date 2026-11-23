class transaction;
  // Stimulus are declared with rand keyword
  rand bit d;
  rand bit rst;
  bit q;

  // Function for Displaying values of d, rst and q
  function void display(string name);
    $display("-------------------------");
    $display("%s", name);
    $display("-------------------------");
    $display("d = %0d, rst = %0d", d, rst);
    $display("q = %0d", q);
    $display("-------------------------");
  endfunction
endclass


