// Code your design here
module updown_counter_8bit #(parameter WIDTH = 8)(
    logic clk,
    logic reset,
    logic en, 
    logic up_down, 
    logic [WIDTH-1:0] count
);

  always_ff @(posedge clk)begin
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
