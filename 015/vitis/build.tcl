# Get the script location
variable script_location [file normalize [info script]]
variable script_root [file dirname $script_location]

# Create the workspace folder
set workspace $script_root./workspace
setws $workspace
cd $workspace

# Copy the hardware definition file from the Vivado output folder
file copy ../../output/vitis_version_control.xsa vitis_version_control.xsa

# Create the application project
app create -name vitis_version_control_app -hw vitis_version_control.xsa -os standalone -proc ps7_cortexa9_0 -template {Empty Application}

# Import sources and build the application project
importsources -name vitis_version_control_app -path $workspace/../src/
app build -name vitis_version_control_app