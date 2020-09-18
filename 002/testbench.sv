module testbench;

    timeunit        1ns;
    timeprecision   1ps;

    logic           clock;
    logic           reset;
    logic           enable;
    logic [15 : 0]  counter_out;

    counter # (
        .COUNTER_WIDTH  (16)
    )
    counter_inst (
        .i_clock    (clock),
        .i_reset    (reset),
        .i_enable   (enable),
        .o_counter  (counter_out)
    );

    // Clock generation
    initial begin
        clock = 1'b0;
        forever begin
            #10ns;
            clock = ~clock;
        end
    end

    // Stimulus
    initial begin
        $display("Starting simulation");
        reset <= 0;
        enable <= 0;
        @(posedge clock);
        reset <= 1;
        @(posedge clock);
        reset <= 0;
        #75ns;
        @(posedge clock);
        enable <= 1;
        #7500ns;
        @(posedge clock);
        enable <= 0;
        #75ns;
        @(posedge clock);
        enable <= 1;
        #15000ns;
        @(posedge clock);
        enable <= 0;
        repeat(3) begin
            @(posedge clock);
        end
        $display("Simulation finished");
        $stop();
    end

endmodule : testbench