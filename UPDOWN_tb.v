// Code your testbench here
// or browse Examples
module tb_updown_counter();
    reg clk;
    reg reset;
    reg up_down;
    wire [7:0] count;

    updown_counter_8bit uut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1'b1; 
        up_down = 1'b0;

        #10;
        reset = 1'b0; 
        
        up_down = 1'b1;
        #200; 
        up_down = 1'b0;
       #50;
        reset = 1'b1;
        #10;
        reset = 1'b0; 
        #50;

        $display("Simulation finished");
        $finish; 
    end

endmodule

