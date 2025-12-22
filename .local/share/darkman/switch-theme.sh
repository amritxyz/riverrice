#!/bin/sh

choice=$(printf "Dark\nLight\n" |
	fuzzel --dmenu --prompt="Theme: " \
	-w 50% -I -l 2 --no-mouse
)

case "$choice" in
Dark)
	# Foot
	echo "initial-color-theme=1" > ~/.config/foot/colors.ini
	killall -s SIGUSR1 foot

	# Neovim
	sed -i "s/modus_operandi/modus_vivendi/g" \
		/home/void/.config/nvim/lua/plugins/color.lua
	echo dark > ~/.config/nvim/modus_state
	killall -s SIGUSR1 nvim

	;;

Light)

	# Foot
	echo "initial-color-theme=2" > ~/.config/foot/colors.ini
	killall -s SIGUSR2 foot

	# Neovim
	sed -i "s/modus_vivendi/modus_operandi/g" \
		/home/void/.config/nvim/lua/plugins/color.lua
	echo light > ~/.config/nvim/modus_state
	killall -s SIGUSR1 nvim

	;;

default) exit 1 ;;
esac
