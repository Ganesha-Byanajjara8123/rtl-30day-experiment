
//day7 . i'm going to build FSM sequence detector by using mealy and overlapping method:
// our sequence is 1011


module fsm_sequence(
input logic clk,
input logic rst,
input logic din,
output logic detected
);

  typedef enum logic [1:0] {S0, S1, S2, S3} state_t;
state_t current_state, next_state;

  always_ff (@ posedge clk)  begin
    if(rst) 
current_state <= S0;
else
current_state <= next_state;
  end

always_comb begin
next_state = current_state;
detected   = 0;

  case(current_state)
S0: begin
  if(din == 1)     // in sequence 1011, we look at 1 in the given rondom input sequence
next_state = S1; 
else 
  next_state = S0;   //if there is no 1 then it remain stay at S0 
end

S1: begin
  if (din == 0)
next_state = S2;   
else
next_state = S1;
end

S2: begin
  if(din == 1)   
next_state = S3;
else
next_state = S0;
end

S3: begin
  if(din == 1)
detected = 1;      // if sequence comes like 101 then it becomes 1011
next_state = S1;   // otherwise if 0 comes it looks 1010, so if i assign S1 it mean 1
end
  endcase
    end
   endmodule

















