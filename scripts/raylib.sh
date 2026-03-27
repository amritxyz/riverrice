#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

TMP_DIR="/opt/void"
LIBS_DIR="$TMP_DIR/libs"

if [ -d "$TMP_DIR" ]; then
	warn "$TMP_DIR Exists..."
else
	log "Creating tmp env in /opt dir..."
	sudo mkdir -p $TMP_DIR
	sudo chown $USER:$USER $TMP_DIR
	success "Successfully Created tmp dir..."
fi

if [ ! -d "$LIBS_DIR" ]; then
	mkdir -p $LIBS_DIR
else
	warn "$LIBS_DIR Exists..."
fi

log "Downloading Raylib..."

if [ ! -d "$LIBS_DIR/raylib" ]; then
	git clone --depth=1 https://github.com/amritxyz/raylib.git "$LIBS_DIR/raylib"
	cd "$LIBS_DIR/raylib/src"
	make clean -j12
	make -j12 GLFW_LINUX_ENABLE_WAYLAND=TRUE
	sudo make install
	success "Successfully Downloaded Raylib."
elif [ -d "$LIBS_DIR/raylib/src" ]; then
	cd "$LIBS_DIR/raylib/src"
	make clean -j12
	make -j12 GLFW_LINUX_ENABLE_WAYLAND=TRUE
	sudo make install
else
	warn "Unknown error, Skipping."
fi
