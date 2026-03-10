
##Generator → mbx1 → Driver → DUT → Monitor → mbx2 → Scoreboard


## In DAY13 i done :-

Interface
Virtual interface
Monitor
Mailbox communication
Transaction-based verification
Scoreboard checking
  
// Code your design here
// Code your design here
interface alu_if;
  logic [7:0] A;
  logic [7:0] B;
  logic [2:0] op;
  logic [7:0] result;
endinterface



class alu_txn;
  rand bit [7:0] A;
  rand bit [7:0] B;
  rand bit [2:0] op;
  
  function void display();
    $display("A=0%d, B=0%d, op=0%d", A, B , op);
  endfunction
  
endclass

//for generator with txn
class generator;
  
  //create driver obj and 
//the transaction generated will be sent to driver
  alu_txn txn;
  mailbox mbx;
  
   function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    repeat(5)begin
    txn = new();      
    txn.randomize();     
      mbx.put(txn);
    end
  endtask
      
endclass

//for active the driver when txn ready
  class driver;
   alu_txn txn;
    mailbox mbx;
     	

    function new(mailbox mbx, virtual alu_if vif);
      this.mbx = mbx;
      this.vif = vif;
      endfunction

    task run();
      repeat(5) begin
        mbx.get(txn);  //take transaction from mailbox-store in txn
        txn.display();
        vif.A = txn.A;
        vif.B = txn.B;
        vif.op = txn.op;
      end
      endtask
  endclass
    
//for monitor to observe the DUT

class monitor;     //make flow like Generator → Driver → DUT → Monitor → Mailbox
  alu_txn txn;
  mailbox mbx;
  virtual alu_if vif;
  
  function  new(mailbox mbx, virtual alu_if vif);
    this.mbx = mbx;
    this.vif = vif;
   endfunction
  
   task run();
     forever 
     #2;
     txn = new();
     
     txn.A = vif.A;
     txn.B = vif.B;
     txn.op = vif.op;
     txn.result = vif.result;
     
     mbx.put(txn);
     
    $display("monitor observing transaction");
    txn.display();
     end
  endtask
endclass

//for scoreboard to compare the expected results with DUT
class scoreboard;
  mailbox mbx;
  alu_txn txn;
  
  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(txn);
      check(txn);
    end 
endclass
