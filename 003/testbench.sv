`timescale 1ns/1ps

module testbench;

    logic           clock;
    logic           reset;
    logic           enable;
    logic [15 : 0]  counter_out;
    logic [15 : 0]  clocking_block;
    logic [15 : 0]  no_clocking_block;

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
            #5ns;
            clock = ~clock;
        end
    end

    // Clocking Block
    clocking cb @(posedge clock);
        default input #1step output #1ns;
        input counter_out;
        output reset, enable;
    endclocking

    // Stimulus
    initial begin
        $timeformat(-9, 3,"ns",5);
        $display("Starting simulation");
        cb.reset <= 0;
        cb.enable <= 0;
        @(cb);
        cb.reset <= 1;
        @(cb);
        cb.reset <= 0;
        #75ns;
        @(cb);
        cb.enable <= 1;
        #750ns;
        @(cb);
        cb.enable <= 0;
        @(cb);
        cb.enable <= 1;
        #155ns;
        @(cb);
        cb.reset <= 1;
        #155ns;
        cb.reset <= 0;
        #500ns;
        @(cb);
        cb.enable <= 0;
        repeat(3) begin
            @(cb);
        end
        $display("Simulation finished");
        $stop();
    end
    assign clocking_block       = cb.counter_out;
    assign no_clocking_block    = counter_out;

endmodule : testbench