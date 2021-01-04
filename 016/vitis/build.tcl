# Get the script location
variable SCRIPT_LOCATION [file normalize [info script]]
variable SCRIPT_ROOT [file dirname $SCRIPT_LOCATION]

# Create the workspace folder
set WORKSPACE $SCRIPT_ROOT./workspace
setws $WORKSPACE
cd $WORKSPACE
# Get the absolute path for the sources
variable SRC_ABS_PATH [file normalize ../src]

# Copy the hardware definition file from the Vivado output folder
file copy ../../output/hello_world_vitis_bd_wrapper.xsa hello_world_vitis.xsa

# Create the application project
app create -name hello_world_vitis_app -hw hello_world_vitis.xsa -os standalone -proc ps7_cortexa9_0 -template {Hello World}

# Import sources and build the application project
importsources -name hello_world_vitis_app -path $SRC_ABS_PATH -soft-link
importsources -name hello_world_vitis_app -path $WORKSPACE/../src/lscript.ld -linker-script
app build -name hello_world_vitis_app