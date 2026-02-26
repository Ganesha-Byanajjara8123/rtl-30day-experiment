// Code your design here
module updown_counter_8bit(
    input clk,
    input reset,
    input up_down, 
    output reg [7:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      
        count <= 8'd0;
    end
    else begin
        if (up_down == 1'b1) begin
            
            count <= count + 1'b1;
        end
        else begin
           
            count <= count - 1'b1;
        end
    end
end

endmodule

