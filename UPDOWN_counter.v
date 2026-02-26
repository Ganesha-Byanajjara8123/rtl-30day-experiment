// Code your design here
module updown_counter_8bit(
    input clk,
    input reset,
    input en, 
    input up_down, 
    output reg [7:0] count
);

  always @(posedge clk)begin
    if (reset == 1'b1) begin
      
        count <= 8'd0;
    end
    else begin
      if (en) begin
        if (up_down) begin
            
            count <= count + 1'b1;
        end
        else begin
           
            count <= count - 1'b1;
        end
    end
end
end

endmodule
