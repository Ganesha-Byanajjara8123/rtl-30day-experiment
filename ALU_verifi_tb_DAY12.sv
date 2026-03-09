##in DAY12 i done
✔ Interface
✔ Virtual Interface
✔ Driver controlling DUT pins
✔ Mailbox communication
✔ Parallel generator/driver execution

// Code your testbench here
// or browse Examples
module tb;
  
  alu_if vif();
  
  alu dut(
    .A(vif.A), .B(vif.B), .op(vif.op), .result(vif.result)
  );
  
mailbox mbx;
generator gen;
driver drv;
  
  initial begin
    mbx = new();
    
    gen = new(mbx);
    drv = new(mbx,vif);
    
    fork
    gen.run();
    drv.run();
    join
    
  end
endmodule
