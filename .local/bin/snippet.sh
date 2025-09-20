#!/bin/sh

wtype $(grep -v '^#' ~/.local/share/snippets | fuzzel -w 90% -I --dmenu | cut -d' ' -f1)
