if [ -f ~/.config/shell/bashrc ]; then
	. ~/.config/shell/bashrc
fi

[[ "$(fgconsole 2>/dev/null)" -eq 1 ]] && exec start_river > /dev/null 2>&1
