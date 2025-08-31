#!/bin/sh

b="$HOME/.mozilla/firefox"
i="$b/profiles.ini"
u="$HOME/.local/share/arkenfox.js"

[ -f "$i" ] || {
	pgrep -u "$USER" firefox >/dev/null && {
		echo "Error: Firefox is running." >&2
		exit 1
	}
	su -l "$USER" -c "firefox --headless" &
	sleep 3
	[ -f "$i" ] || {
		echo "Error: Failed to generate $i" >&2
		exit 1
	}
}

p=$(awk '
/^\[Install/ || /^\[Profile0\]/ { d=1; next }
/^\[/ { d=0 }
d && /^Default=/ {
	sub(/[^=]*=/, "")
	gsub(/^[ \t\r]+|[ \t\r]+$/, "")
	print $0; exit
}
' "$i")

[ -n "$p" ] || p=$(sed -n 's/^Default=//p' "$i" | head -n1 | tr -d '\r')
[ -n "$p" ] || {
	echo "Error: No Default profile found in $i" >&2
	exit 1
}

d="$b/$p"

[ -d "$d" ] || {
	echo "Error: Profile dir not found: $d" >&2
	exit 1
}

[ -f "$u" ] || {
	echo "Error: Custom user.js not found: $u" >&2
	exit 1
}

rm -f "$d"/user.js "$d"/.parentlock "$d"/parent.lock "$d"/lock
cp "$u" "$d/user.js"

echo "Custom user.js installed."
exit 0
