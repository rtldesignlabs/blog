# Get the script location
variable script_location [file normalize [info script]]
variable script_root [file dirname $script_location]
# Create a temporary folder where the tool will run
set temp_folder $script_root/../temp
file mkdir $temp_folder
cd $temp_folder
# Define the output directories
set output_dir_synth $script_root/../output/synthesis
set output_dir_place $script_root/../output/place
set output_dir_route $script_root/../output/route
file mkdir $output_dir_synth
file mkdir $output_dir_place
file mkdir $output_dir_route

# Set the target part, read design sources and constraints
set_part xc7k70tfbg484-2
read_vhdl -library bftLib [glob $script_root/../hdl/bft_lib/*.vhdl]
read_vhdl $script_root/../hdl/bft.vhdl
read_verilog  [glob ../hdl/*.v]
read_xdc $script_root/../constraints/bft_full_kintex7.xdc

# Run synthesis, report utilization and timing estimates, write the post-syntheis design checkpoint
synth_design -top bft
write_checkpoint -force $output_dir_synth/post_synth
report_timing_summary -file $output_dir_synth/post_synth_timing_summary.rpt
report_power -file $output_dir_synth/post_synth_power.rpt
report_clock_interaction -delay_type min_max -file $output_dir_synth/post_synth_clock_interaction.rpt
report_high_fanout_nets -fanout_greater_than 200 -max_nets 50 -file $output_dir_synth/post_synth_high_fanout_nets.rpt

# Run placement and logic optimzation, report utilization and timing estimates, write the post-placement design checkpoint
opt_design
place_design
phys_opt_design
write_checkpoint -force $output_dir_place/post_place
report_timing_summary -file $output_dir_place/post_place_timing_summary.rpt

# Run router, report actual utilization and timing, write the post-routing design checkpoint, run drc, write verilog and xdc out
route_design
write_checkpoint -force $output_dir_route/post_route
report_timing_summary -file $output_dir_route/post_route_timing_summary.rpt
report_timing -max_paths 100 -path_type summary -slack_lesser_than 0 -file $output_dir_route/post_route_setup_timing_violations.rpt
report_clock_utilization -file $output_dir_route/clock_util.rpt
report_utilization -file $output_dir_route/post_route_util.rpt
report_power -file $output_dir_route/post_route_power.rpt
report_drc -file $output_dir_route/post_imp_drc.rpt
write_verilog -force $output_dir_route/bft_impl_netlist.v
write_xdc -no_fixed_only -force $output_dir_route/bft_impl.xdc

# Generate the bitstream
write_bitstream -force $output_dir_route/bft.bit