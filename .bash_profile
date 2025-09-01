# ~/.bash_profile
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
[[ "$(fgconsole 2>/dev/null)" -eq 1 ]] && exec start_river > /dev/null 2>&1
