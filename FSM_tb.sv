
module fsm_sequence_tb();

    logic clk;
    logic rst;
    logic din;
    logic detected;

    fsm_sequence uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .detected(detected)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        din = 0;

        repeat(2) @(posedge clk);
        rst = 0;

        // Serial pattern: 1 0 1 1 0 1 1
        @(posedge clk);
        din = 1;

        @(posedge clk);
        din = 0;

        @(posedge clk);
        din = 1;

        @(posedge clk);
        din = 1;

        @(posedge clk);
        din = 0;

        @(posedge clk);
        din = 1;

        @(posedge clk);
        din = 1;

        #20 $finish;
    end

    initial begin
        $monitor("t=%0t rst=%0b din=%0b detected=%0b state=%0d",
                 $time, rst, din, detected, uut.current_state);
    end

endmodule
