#!/bin/sh

color=$(grim -g "$(slurp -b '#00000000' -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | awk 'END{print $3}')
printf '%s' "$color" | wl-copy
notify-send -u low "Color copied" "$color"
