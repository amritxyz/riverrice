wtype $(grep -v '^#' ~/.local/share/snippets | tofi --width 65% --num-results 6 --prompt-text "Snippets: " | cut -d' ' -f1)
