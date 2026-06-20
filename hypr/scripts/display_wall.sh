# Define your terminal emulator (e.g., kitty, alacritty, foot)
TERM_EMU="kitty"

# Array of commands to run
COMMANDS=(
    "btop"
    "fastfetch"
    "nvtop"
    "cbonsai -S -L 50 -M 5 -t 20 -S"
)

type_command() {
    local cmd="$1"
    # Open a fresh terminal window
    $TERM_EMU & 

    # Wait for the window to map and gain window focus
    sleep 0.3 

    # Type out the command string letter by letter
    # -d 40 adds a 40ms delay between each keystroke
    wtype -d 40 "$cmd"

    # Mimic pressing the 'Enter' key
    sleep 0.1
    wtype -k Return
}

# Loop through each command with a delay between window spawns
for cmd in "${COMMANDS[@]}"; do
    type_command "$cmd"
    sleep 0.4 # Delay before opening the next terminal window
done
