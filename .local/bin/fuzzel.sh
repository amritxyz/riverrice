#!/bin/sh

#
fuzzel -T footclient -w 64 -b 002b36ff -t 839496ff -m dc322fff \
	-s 073642ff -B 2 -r 0 -C 839496ff --font Hack -I -D no \
	--filter-desktop $@ <&0 --cache=/dev/null
