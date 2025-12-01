#!/bin/sh

# Config
folder="$HOME/.local/dox/notes/mds/"
mkdir -p "$folder"

# Terminal
TERMINAL="foot"

# New note function
newnote() {
	# Prompt for name
	name=$(fuzzel --no-mouse --dmenu --prompt="Enter note name: " -w 50% -I -l 0 <<EOF
EOF
	)
	[ -z "$name" ] && exit 0
	[ -z "$name" ] || name=$(date +%F_%H-%M-%S)
	name=$(echo "$name" | sed 's/[[:space:]]\+/_/g')
	setsid -f "$TERMINAL" --title="$name" nvim "$folder${name}.md" >/dev/null 2>&1
}

# Select existing or create new
selected() {
	# List note names (without .md, spaces instead of underscores), sorted newest first
	files=$(find "$folder" -maxdepth 1 -name "*.md" -type f -printf '%f\n' | \
		sed 's/\.md$//' | sed 's/_/ /g' | sort -r)

	# Build list: "New" + one note per line (no indentation!)
	choices="New
$files"

	# Show in fuzzel
	choice=$(echo "$choices" | fuzzel --dmenu \
		--prompt="Choose note or create new: " -w 50% -I -l 5)

	[ -z "$choice" ] && exit 0

	case "$choice" in
		New) newnote ;;
		*)
			filename=$(echo "$choice" | sed 's/[[:space:]]\+/_/g')
			filepath="$folder${filename}.md"
			[ ! -f "$filepath" ] && echo "# $choice" > "$filepath"
			setsid -f "$TERMINAL" --title="$filename" nvim "$filepath" >/dev/null 2>&1
			;;
	esac
}

# Run
selected
