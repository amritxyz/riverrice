#!/usr/bin/bash

# Config
folder="$HOME/.local/dox/notes/mds/"
mkdir -p "$folder"

# Terminal (foot)
TERMINAL="foot"

# New note function
newnote() {
    # Use fuzzel to prompt for a new note name
    name=$(fuzzel --dmenu --prompt="Enter note name: " -w 50% \
	-b 002b36cc -t 586e75ff -M cb4b16ff -m 657b83ff -S 93a1a1ff \
	-s 073642cc -B 2 -r 0 -C 073642ff --input-color cb4b16ff \
        --font "monospace:size=12" -I -D no -l 0 --cache=/dev/null \
        <<< "")

        # Exit if canceled
        [ -z "$name" ] && exit 0

        # Fallback to timestamp if empty
        : "${name:=$(date +%F_%H-%M-%S)}"

        # Sanitize filename (replace spaces with underscores)
        name=$(echo "$name" | sed 's/[[:space:]]\+/_/g')

        # Open in foot + nvim
        setsid -f "$TERMINAL" --title="$name" nvim "$folder${name}.md" >/dev/null 2>&1
    }

# Select existing or create new
selected() {
    # List existing .md files sorted by modification time (newest first)
    mapfile -t files < <(find "$folder" -maxdepth 1 -name "*.md" -type f -printf '%f\n' | sort -r)

    # Prepend "New" option
    choices=("New")
    for file in "${files[@]}"; do
        # Remove .md extension for display
        display="${file%.md}"
        display="${display//_/ }"  # Optional: show spaces instead of underscores
        choices+=("$display")
    done

    # Join choices for fuzzel
    IFS=$'\n'
    choice=$(printf '%s\n' "${choices[*]}" | fuzzel --dmenu \
        --prompt="Choose note or create new: " -w 50% \
	-b 002b36cc -t 586e75ff -M cb4b16ff -m 657b83ff -S 93a1a1ff \
	-s 073642cc -B 2 -r 0 -C 073642ff --input-color cb4b16ff \
        --font "monospace:size=12" -I -D no -l 5 --cache=/dev/null)

        # Exit if nothing selected
        [ -z "$choice" ] && exit 0

        case "$choice" in
            "New")
                newnote
                ;;
            *)
                # Convert display name (spaces) back to filename (underscores)
                filename=$(echo "$choice" | sed 's/[[:space:]]\+/_/g')
                # Ensure .md extension
                filepath="$folder${filename}.md"
                # Create file if it doesn't exist
                [ ! -f "$filepath" ] && echo "# $choice" > "$filepath"
                # Open in foot
                setsid -f "$TERMINAL" --title="$filename" nvim "$filepath" >/dev/null 2>&1
                ;;
        esac
    }

# Run selected
selected
