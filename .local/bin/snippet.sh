#!/bin/sh

wtype $(grep -v '^#' ~/.local/share/snippets | fuzzel -w 90% -I --no-mouse --dmenu | cut -d' ' -f1)
