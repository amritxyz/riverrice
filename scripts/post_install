#!/bin/sh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[0;36m"
RESET="\033[0m"
BOLD="\033[1m"
CHECK="[OK]"
CROSS="[FAIL]"
INFO="[INFO]"

log() {
	echo -e "${BLUE}[INFO]$(date +'%Y-%m-%d %H:%M:%S')${RESET} $1"
}

ask() {
	echo -ne "${CYAN}$1 ${RESET}"
}

success() {
	echo -e "${GREEN}${CHECK} $1${RESET}"
}

warn() {
	echo -e "${YELLOW}${INFO} $1${RESET}"
}

fail() {
	echo -e "${RED}${CROSS} $1${RESET}"
}

BAK_MAIN_DIR="/opt/void"
BAK_DIR="/opt/void/bak"
GIT_DIR="$BAK_MAIN_DIR/git-repos"
JSQL_FILE="mysql-connector-j-9.3.0"
XAMPP_FILE="lampp"
MUSIC_TAR="music.tar"
BOOKS_TAR="books.tar"
MUSIC_DIR="music"
BOOKS_DIR="books"
PRACTICE_DIR="practice"
NOTES_DIR="notes"
REACT_DIR="react_dev"
TYPLTX="typst_latex"

# /opt/void
if [ -d "$BAK_MAIN_DIR" ]; then
	warn "$BAK_MAIN_DIR already exists. Skipping creation."
else
	sudo mkdir "$BAK_MAIN_DIR"
	sudo chown "$USER:$USER" "$BAK_MAIN_DIR"
fi

# /opt/void/bak
if [ -d "$BAK_DIR" ]; then
	warn "$BAK_DIR already exists. Skipping creation."
else
	mkdir -p "$BAK_DIR"
fi

# /opt/void/git-repos
if [ -d "$GIT_DIR" ]; then
	warn "$GIT_DIR already exists. Skipping creation."
else
	mkdir -p "$GIT_DIR"
fi

mkdir -p $HOME/.local/{share,bin,dox,git-repos,hugo-dir,vids,audio}

# Notes
# cd "$HOME/.local/dox/"
# if [ -d "$NOTES_DIR" ]; then
# 	warn "$NOTES_DIR already exists. Skipping."
# else
# 	ask ":: Would you like to get some Notes? [Y/n] "
# 	read -r NOTES
# 	if [ "$NOTES" = "Y" ] || [ "$NOTES" = "y" ] || [ -z "$NOTES" ]; then
# 		git clone --depth=1 https://codeberg.org/amritxyz/notes.git "$NOTES_DIR"
# 		success "Cloned Notes repo."
# 	fi
# fi

# AUR [ yay-bin ]
cd "/opt/void/"
ask ":: Would you like to install AUR helper? [Y/n] "
read -r AUR
if [ "$AUR" = "Y" ] || [ "$AUR" = "y" ] || [ -z "$AUR" ]; then
	git clone --depth=1 https://aur.archlinux.org/yay-bin.git
	cd yay-bin
	makepkg -si
	cd -
	rm -rf yay-bin
	success "Successfully installed AUR helper. [ YAY ]"
fi

# Music
cd "$HOME/.local/"

if [ -d "$MUSIC_DIR" ] || [ -f "$MUSIC_TAR" ]; then
	warn "$MUSIC_DIR or $MUSIC_TAR exists. Skipping."
	ask ":: Would you like to re-download Music Dir? [y/N] "
	read -r RE_MUSIC
	if [ "$RE_MUSIC" = "Y" ] || [ "$RE_MUSIC" = "y" ]; then
		if [ -f "$HOME/.local/bin/bak" ]; then
			"$HOME/.local/bin/bak" "$MUSIC_DIR"
		else
			mv "$MUSIC_DIR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_music_bak"
		fi
		rm -rf "$MUSIC_TAR" "$MUSIC_DIR"
		wget -q --show-progress -O "$MUSIC_TAR" https://codeberg.org/amritxyz/tars/media/branch/main/music.tar
		mkdir "$MUSIC_DIR"
		tar --strip-components=1 -xf "$MUSIC_TAR" -C "$MUSIC_DIR"
		mkdir -p "$BAK_DIR"
		mv "$MUSIC_TAR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_$MUSIC_TAR"
		success "Music downloaded and extracted."
	fi
else
	ask ":: Would you like to get some Music? [Y/n] "
	read -r MUSIC
	if [ "$MUSIC" = "Y" ] || [ "$MUSIC" = "y" ] || [ -z "$MUSIC" ]; then
		wget -q --show-progress -O "$MUSIC_TAR" https://codeberg.org/amritxyz/tars/media/branch/main/music.tar
		mkdir "$MUSIC_DIR"
		tar --strip-components=1 -xf "$MUSIC_TAR" -C "$MUSIC_DIR"
		mkdir -p "$BAK_DIR"
		mv "$MUSIC_TAR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_$MUSIC_TAR"
		success "Music downloaded and extracted."
	fi
fi

# Books
cd "$HOME/.local/dox/"
if [ -d "$BOOKS_DIR" ] || [ -f "$BOOKS_TAR" ]; then
	warn "$BOOKS_DIR or $BOOKS_TAR exists. Skipping."
	ask ":: Would you like to re-download the Books archive? [y/N] "
	read -r RE_BOOKS
	if [ "$RE_BOOKS" = "Y" ] || [ "$RE_BOOKS" = "y" ]; then
		if [ -f "$HOME/.local/bin/bak" ]; then
			"$HOME/.local/bin/bak" "$BOOKS_DIR"
		else
			mv "$BOOKS_DIR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_books_bak"
		fi
		rm -rf "$BOOKS_TAR" "$BOOKS_DIR"
		wget -q --show-progress -O "$BOOKS_TAR" https://codeberg.org/amritxyz/tars/media/branch/main/books.tar
		mkdir "$BOOKS_DIR"
		tar --strip-components=1 -xf "$BOOKS_TAR" -C "$BOOKS_DIR"
		mkdir -p "$BAK_DIR"
		mv "$BOOKS_TAR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_$BOOKS_TAR"
		success "Books archive downloaded and extracted."
	fi
else
	ask ":: Would you like to download the Books archive? [Y/n] "
	read -r BOOKS
	if [ "$BOOKS" = "Y" ] || [ "$BOOKS" = "y" ] || [ -z "$BOOKS" ]; then
		wget -q --show-progress -O "$BOOKS_TAR" https://codeberg.org/amritxyz/tars/media/branch/main/books.tar
		mkdir "$BOOKS_DIR"
		tar --strip-components=1 -xf "$BOOKS_TAR" -C "$BOOKS_DIR"
		mkdir -p "$BAK_DIR"
		mv "$BOOKS_TAR" "$BAK_DIR/$(date '+%Y-%m-%d_%H-%M-%S')_$BOOKS_TAR"
		success "Books archive downloaded and extracted."
	fi
fi

ask ":: Would you like to install Libre-Office? [Y/n] "
read -r LO
if [ "$LO" = "Y" ] || [ "$LO" = "y" ] || [ -z "$LO" ]; then
	if [ -d $HOME/.config/libreoffice/4/user ]; then
		warn "Libre-office config already exists. Skipping."
	else
		mkdir -p $HOME/.config/libreoffice/4/user/
		touch $HOME/.config/libreoffice/4/user/registrymodifications.xcu
	fi
	wget -q --show-progress -O $HOME/.config/libreoffice/4/user/registrymodifications.xcu https://codeberg.org/amritxyz/dev/raw/branch/main/xml/registrymodifications.xcu
	sudo pacman -S libreoffice-fresh
	success "Libre-office successfully installed."
fi
