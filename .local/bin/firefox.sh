#!/bin/sh

browserdir="/home/void/.mozilla/firefox"
profilesini="$browserdir/profiles.ini"

# Start firefox in headless mode
if [ ! -f "$profilesini" ]; then
	sudo -u "$USER" firefox --headless >/dev/null 2>&1 &
	sleep 1
fi

profile=$(sed -n "/Default=.*.default/ s/.*=//p" "$profilesini")
pdir="$browserdir/$profile"

if [ -d "$pdir" ]; then
	custom_userjs="/home/$USER/.local/share/arkenfox.js"
	if [ -f "$custom_userjs" ]; then
		rm -rf $pdir/* && rm -rf $pdir/.parentlock
		cp "$custom_userjs" "$pdir/user.js"
		pkill firefox
		echo "Custom user.js has been installed to the profile."
	else
		echo "Error: ~/.local/share/user.js not found."
	fi
else
	echo "Error: Firefox profile directory not found."
fi
