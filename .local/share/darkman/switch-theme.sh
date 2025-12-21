#!/bin/sh

choice=$(printf "Dark\nLight\n" |
	fuzzel --dmenu --prompt="Theme: " \
	-w 50% -I -l 2 --no-mouse
)

case "$choice" in
Dark)
	# Fuzzel
	cp ~/.config/fuzzel/colors/dark.ini ~/.config/fuzzel/colors/colors.ini

	# Imv
	sed -i 's|^\(background *= *\).*|\1#000000|' ~/.config/imv/config

	# River
	riverctl background-color 0x000000 # bg-main
	riverctl border-color-focused 0xffffff # fg-main
	riverctl border-color-unfocused 0x646464 # border
	riverctl border-color-urgent 0xff5f59 # red
	echo "riverctl background-color 0x000000 # bg-main" > ~/.config/river/colors
	echo "riverctl border-color-focused 0xffffff # fg-main" >> ~/.config/river/colors
	echo "riverctl border-color-unfocused 0x646464 # border" >> ~/.config/river/colors
	echo "riverctl border-color-urgent 0xff5f59 # red" >> ~/.config/river/colors
	echo "riverctl spawn "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"" >> ~/.config/river/colors
	echo "riverctl spawn "gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'"" >> ~/.config/river/colors

	# Foot
	echo "initial-color-theme=1" > ~/.config/foot/colors.ini
	killall -s SIGUSR1 foot

	# Cmus
	cp ~/.config/cmus/colors/dark ~/.config/cmus/colors/color
	cmus-remote -C "source ~/.config/cmus/colors/color"

	# Fzf
	cp ~/.config/fzf/dark ~/.config/fzf/color
	export FZF_DEFAULT_OPTS="$(cat ~/.config/fzf/color)"

	# Neovim
	sed -i "s/modus_operandi/modus_vivendi/g" \
		/home/void/.config/nvim/lua/plugins/color.lua
	echo dark > ~/.config/nvim/modus_state
	killall -s SIGUSR1 nvim

	# Newsboat
	cp ~/.config/newsboat/colors/dark ~/.config/newsboat/colors/color

	# Mako
	cp ~/.config/mako/colors/dark ~/.config/mako/colors/color
	killall mako && mako &

	# QT5CT/QT6CT
	cp ~/.config/qt5ct/colors/dark.conf ~/.config/qt5ct/colors/color.conf
	cp ~/.config/qt6ct/colors/dark.conf ~/.config/qt6ct/colors/color.conf
	killall -s SIGUSR1 qt5ct qt6ct

	# Tmux
	echo "source-file ~/.config/tmux/colors/dark.conf" > ~/.config/tmux/colors/color.conf
	tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null

	# Waybar
	cp ~/.config/waybar/colors/dark.css ~/.config/waybar/colors/colors.css
	pkill -SIGUSR2 waybar

	# Zathura
	sed -i 's|include light|include dark|' ~/.config/zathura/zathurarc
	killall -SIGUSR2 zathura

	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

	notify-send -u low "Theme Changed" "Dark mode activated"

	;;

Light)
	# Fuzzel
	cp ~/.config/fuzzel/colors/light.ini ~/.config/fuzzel/colors/colors.ini

	# Imv
	sed -i 's|^\(background *= *\).*|\1#ffffff|' ~/.config/imv/config

	# River
	riverctl background-color 0xffffff # bg-main
	riverctl border-color-focused 0x000000 # fg-main
	riverctl border-color-unfocused 0x9f9f9f # border
	riverctl border-color-urgent 0xa60000 # red
	echo "riverctl background-color 0xffffff # bg-main" > ~/.config/river/colors
	echo "riverctl border-color-focused 0x000000 # fg-main" >> ~/.config/river/colors
	echo "riverctl border-color-unfocused 0x9f9f9f # border" >> ~/.config/river/colors
	echo "riverctl border-color-urgent 0xa60000 # red" >> ~/.config/river/colors
	echo "riverctl spawn "gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'"" >> ~/.config/river/colors
	echo "riverctl spawn "gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'"" >> ~/.config/river/colors

	# Foot
	echo "initial-color-theme=2" > ~/.config/foot/colors.ini
	killall -s SIGUSR2 foot

	# Cmus
	cp ~/.config/cmus/colors/light ~/.config/cmus/colors/color
	cmus-remote -C "source ~/.config/cmus/colors/color"

	# Fzf
	cp ~/.config/fzf/light ~/.config/fzf/color
	export FZF_DEFAULT_OPTS="$(cat ~/.config/fzf/color)"

	# Neovim
	sed -i "s/modus_vivendi/modus_operandi/g" \
		/home/void/.config/nvim/lua/plugins/color.lua
	echo light > ~/.config/nvim/modus_state
	killall -s SIGUSR1 nvim

	# Newsboat
	cp ~/.config/newsboat/colors/light ~/.config/newsboat/colors/color

	# Mako
	cp ~/.config/mako/colors/light ~/.config/mako/colors/color
	killall mako && mako &

	# QT5CT/QT6CT
	cp ~/.config/qt5ct/colors/light.conf ~/.config/qt5ct/colors/color.conf
	cp ~/.config/qt6ct/colors/light.conf ~/.config/qt6ct/colors/color.conf

	# Tmux
	echo "source-file ~/.config/tmux/colors/light.conf" > ~/.config/tmux/colors/color.conf
	tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null

	# Waybar
	cp ~/.config/waybar/colors/light.css ~/.config/waybar/colors/colors.css
	pkill -SIGUSR2 waybar

	# Zathura
	sed -i 's|^include .*|include "~/.config/zathura/light"|' ~/.config/zathura/zathurarc
	killall -SIGUSR2 zathura

	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

	notify-send -u low "Theme Changed" "Light mode activated"

	;;

default) exit 1 ;;
esac
