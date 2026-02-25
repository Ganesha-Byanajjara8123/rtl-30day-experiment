// Code your testbench here
// or browse Examples
// 4:1 MUX tb code
module MUX_tb;
   reg   [2:0]   A, B, C, D;
   reg   [1:0]   sel;
   wire [2:0]   X;

  MUX uut (
    .A(A), .B(B), .C(C), .D(D), .sel(sel), .X(X)
  );
  
initial begin
  $monitor("t=%0t, A=%d, B=%d, C=%d, D=%d, sel=%d, X=%d", $time, A, B, C, D, sel, X);
  
A=2'b00;  
B=2'b01;  
C=2'b10;  
D=2'b11;  
sel = 2'b00; 
  
 #10 sel = 2'b01;
  #10 sel = 2'b11;
  #10 sel = 2'b10;
  
  
  #100 $finish;
end

endmodule

  
