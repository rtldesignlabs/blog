exec xvhdl  ./counter.vhd
exec xvlog  ./testbench.sv -sv
exec xelab  testbench -s testbench_sim -debug typical
exec xsim   testbench_sim -R