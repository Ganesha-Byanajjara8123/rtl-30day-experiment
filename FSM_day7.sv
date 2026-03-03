
//day7 . i'm going to build FSM sequence detector by using mealy and overlapping method:
// our sequence is 1011


module fsm_sequence(
    input  logic clk,
    input  logic rst,
    input  logic din,
    output logic detected
);

    typedef enum logic [1:0] {S0, S1, S2, S3} state_t;
    state_t current_state, next_state;

    // State register
    always_ff @(posedge clk) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always_comb begin
        next_state = current_state;
        detected   = 0;

        case (current_state)

            S0: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (!din)
                    next_state = S2;
                else
                    next_state = S1;
            end

            S2: begin
                if (din)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (din) begin
                    detected   = 1;
                    next_state = S1;
                end
                else begin
                    next_state = S2;
                end
            end

        endcase
    end

endmodule















