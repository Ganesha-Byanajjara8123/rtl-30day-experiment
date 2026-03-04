
//tb code for ALU
module alu_tb;
  logic clk;
  logic rst;
  logic [7:0] A;
  logic [7:0] B;
  logic [2:0] op;
  logic [7:0] result;
  logic carry;
  logic zero;
  logic overflow;
 
  
  alu #(.WIDTH(8)) 
  uut(
    .clk(clk), .rst(rst), .A(A), .B(B), .op(op), .result(result), .carry(carry), .zero(zero), .overflow(overflow)
  );
  
  logic [7:0] expected;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    repeat(100) begin
      A = $urandom_range(0,255);
      B = $urandom_range(0,255);
      op= $urandom_range(0,4);
    end
    
    op = 3'b000;
    expected = A + B;
    @(posedge clk);
    
    if(result != expected)
      $error("mismatch!");
    
    op = 3'b001;
    expected = A - B;
    @(posedge clk);
    
    if(result != expected)
      $error("mismatch!");
    
    op = 3'b010;
    expected = A & B;
    @(posedge clk);
    
    if(result != expected)
      $error("mismatch!");
    
    op = 3'b011;
    expected = A | B;
    @(posedge clk);
    
    if(result != expected)
      $error("mismatch!");
    
     op = 3'b100;
    expected = A ^ B;
    @(posedge clk);
   
    if(result != expected)
      $error("mismatch!");
    
   
     #20; $finish;
  end
  
  initial begin
$monitor("time=%0t A=%0d B=%0d op=%0b result=%0d carry=%0b zero=%0b overflow=%0b",
         $time, A, B, op, result, carry, zero, overflow);
  end
endmodule




//output i got from the above and design code
# KERNEL: Kernel process initialization done.
# Allocation: Simulator allocated 4552 kB (elbread=427 elab2=4117 kernel=7 sdf=0)
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: time=0 A=112 B=199 op=0 result=55 carry=1 zero=0 overflow=0
# KERNEL: time=5 A=112 B=199 op=1 result=169 carry=1 zero=0 overflow=0
# KERNEL: time=15 A=112 B=199 op=10 result=64 carry=0 zero=0 overflow=0
# KERNEL: time=25 A=112 B=199 op=11 result=247 carry=0 zero=0 overflow=0
# KERNEL: time=35 A=112 B=199 op=100 result=183 carry=0 zero=0 overflow=0
# RUNTIME: Info: RUNTIME_0068 testbench.sv (70): $finish called.
