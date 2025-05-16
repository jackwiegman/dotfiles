#!/bin/zsh
# Only run on TTY1
# if [[ -z "$DISPLAY" && "$XDG_VTNR" == "1" ]]; then
# 
#   export PATH="$HOME/.local/bin:$PATH"
# 
#   # Run the chooser script and log its output
#   ~/.local/bin/start-wm.sh > "$HOME/.wm.log" 2>&1
# fi

# If in interactive display tty1
# if [[ -z "$DISPLAY" ]]; then
#   
#     # Source user bin directory 
#     export PATH="$HOME/.local/bin:$PATH"
#     # Execute login chooser script 
#     exec start-wm
# fi
