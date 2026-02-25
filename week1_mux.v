//4:1 MUX

module MUX(
  input  [7:0]  A, B, C, D,
  input  [3:0 ] sel,
  output [7:0]  X
);

  always@(*) begin
    case(sel)
      2'b00: X = A;
      2'b01: X = B;
      2'b10: X = C;
      2'b11: X = D;
      default: X = 8'b00; 
      end
endmodule
      
      
