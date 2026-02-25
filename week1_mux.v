//4:1 MUX

module MUX(
  input A, B, C, D
  input S1, S2
  output X
);

  always@(posedge clk) begin
    case(S1, S2)
      X : A; S1;
      X : B; S2;
      X : C; S1;
      X : D; S2;
      end
endmodule
      
