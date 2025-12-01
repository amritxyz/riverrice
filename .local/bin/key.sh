#!/bin/sh

wl-present freeze

wtype $(grep -v '^#' ~/.local/share/key | fuzzel -w 50% -I -l 0 --no-mouse --dmenu | cut -d' ' -f1)

wl-present unfreeze
