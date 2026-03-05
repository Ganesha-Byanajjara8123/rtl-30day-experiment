//YES today-day9, i'm going to build ALU with 
transaction
generator
driver
monitor
scoreboard
environment
testbench

//out of these i will deal with transaction, generator,driver. 

// Code your design here

//for transanction
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
  driver  drv;
  
  task run();
    drv = new();
    
    repeat(5)begin
    txn = new(); 
    txn.randomize();
    drv.driver(txn);
    txn.display();
    end
  endtask
      
endclass

//for active the driver when txn ready
class driver;
    
  task drive(alu_txn txn);
    $display("driver reccieved transaction");
      txn.display();
    endtask
endclass
    



    

