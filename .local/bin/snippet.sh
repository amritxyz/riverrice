#!/bin/bash

# This script lets you quickly insert a snippet from ~/.local/share/snippets.
# It uses `fuzzel` for selection and `wtype` to insert the chosen snippet.

# -M ea6962ff
wtype $(grep -v '^#' ~/.local/share/snippets | fuzzel -w 90% \
	-b 1d2021cc -t 766564ff -M e78a4eff -m 928374ff -S ddc7a1ff \
	-s 282828cc -B 2 -r 0 -C 3c3836ff --input-color e78a4eff \
	--font monospace:size=12 -I -D no --cache=/dev/null --dmenu | cut -d' ' -f1)
