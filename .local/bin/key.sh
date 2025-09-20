#!/bin/sh

wl-present freeze

wtype $(grep -v '^#' ~/.local/share/key | fuzzel -w 50% \
	-b 1d2021cc -t 766564ff -M e78a4eff -m 928374ff -S ddc7a1ff \
	-s 282828cc -B 2 -r 0 -C 3c3836ff --input-color e78a4eff \
	--font monospace:size=12 -I -D no -l 0 --cache=/dev/null --dmenu | cut -d' ' -f1)

wl-present unfreeze
