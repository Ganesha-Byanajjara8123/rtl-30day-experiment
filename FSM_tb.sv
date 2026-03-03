
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



//output 
# KERNEL: t=0 rst=1 din=0 detected=0 state=x
# KERNEL: t=5 rst=1 din=0 detected=0 state=0
# KERNEL: t=15 rst=0 din=0 detected=0 state=0
# KERNEL: t=25 rst=0 din=1 detected=0 state=0
# KERNEL: t=35 rst=0 din=0 detected=0 state=1
# KERNEL: t=45 rst=0 din=1 detected=0 state=2
# KERNEL: t=55 rst=0 din=1 detected=1 state=3
# KERNEL: t=65 rst=0 din=0 detected=0 state=1
# KERNEL: t=75 rst=0 din=1 detected=0 state=2
# KERNEL: t=85 rst=0 din=1 detected=1 state=3
# KERNEL: t=95 rst=0 din=1 detected=0 state=1
