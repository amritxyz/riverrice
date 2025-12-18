#!/bin/sh

pgrep -x wl-present >/dev/null && wl-present freeze

wtype $(grep -v '^#' ~/.local/share/key | fuzzel -w 50% -I -l 0 --no-mouse --password --dmenu | cut -d' ' -f1)

pgrep -x wl-present >/dev/null && wl-present unfreeze
