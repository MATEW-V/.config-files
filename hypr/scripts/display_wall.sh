# Define your terminal emulator
TERM_EMU="kitty"

# Array of commands to run
COMMANDS=(
    "btop"
    "fastfetch"
    "nvtop"
    "cbonsai -S -L 50 -M 5 -t 20 -S"
)

# Loop through each command and launch it natively
for cmd in "${COMMANDS[@]}"; do
    # --start-as=maximized fixes the btop size crash
    # --detach opens the terminal and immediately frees up the script to open the next one
    $TERM_EMU --start-as=maximized --detach sh -c "$cmd; exec bash"
    
    sleep 0.2 # Small delay between window spawns
done