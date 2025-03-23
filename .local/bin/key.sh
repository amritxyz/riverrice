wtype $(grep -v '^#' ~/.local/share/key | tofi --height 18% --num-results 3 --prompt-text "Key: " | cut -d' ' -f1)
