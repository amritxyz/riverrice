#!/bin/sh

wtype $(grep -v '^#' ~/.local/share/snippets | fuzzel -w 90% -I --no-mouse --dmenu --match-mode=exact --no-sort | cut -d' ' -f1)
