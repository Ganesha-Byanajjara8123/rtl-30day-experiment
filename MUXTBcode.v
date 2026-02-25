// 4:1 MUX tb code
module MUX_tb;
  input reg   [3:0]   A, B, C, D;
  input reg   [1:0]   sel;
  output wire [3:0]   X;

  MUX uut (
    .A(A), .B(B), .C(C), .D(D), sel(sel), X(x)
  );
  
initial begin
A=2'b00; sel=2'b00; #10;
A=2'b01; sel=2'b01; #10;
A=2'b10; sel=2'b10; #10;
A=2'b11; sel=2'b11; #10;
  #100 $finish;
  $monitor("t=%0 | A=%d | B=%d | C=%d | D=%d | sel=%d | X=%d", $time A, B, C, D, sel, X};
end
endmodule

  
