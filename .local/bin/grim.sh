#!/bin/sh

SAVE_DIR="$HOME/.local/ss"
mkdir -p "$SAVE_DIR"

max=0
for f in "$SAVE_DIR"/*_screenshot.png; do
	[ -e "$f" ] || continue
	n=${f##*/}
	n=${n%%_*}
	case $n in
	*[!0-9]*) ;; 
	*) [ $n -gt $max ] && max=$n
	esac
done

next=$((max + 1))
file="$SAVE_DIR/${next}_screenshot.png"

region=$(slurp) || exit 1
grim -g "$region" "$file" && wl-copy < "$file"
notify-send "${next}_screenshot.png" "copied to clipboard!"
