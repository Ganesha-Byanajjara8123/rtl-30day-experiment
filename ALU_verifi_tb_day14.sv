
##in day14 i create
Generator
   ↓
Mailbox (mbx_gd)
   ↓
Driver
   ↓
Interface
   ↓
DUT
   ↓
Monitor
   ↓
Mailbox (mbx_ms)
   ↓
Scoreboard


module tb;
  
  alu_if vif();
  
 mailbox mbx_gd;
 mailbox mbx_ms;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sb;
  
  
  initial begin
    mbx_gd = new();
    mbx_ms = new();
    
    gen = new(mbx_gd);
    drv = new(mbx_gd, vif);
    mon = new(mbx_ms,  vif);
    sb  = new(mbx_ms);
    
    fork
    gen.run();
    drv.run();
    mon.run();
    sb.run ();
  join`
    
  end
  
  
endmodule
