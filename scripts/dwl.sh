#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Installing DWL ..."

if [ ! -d "$HOME/.local/src/" ]; then
	mkdir -p $HOME/.local/src/
fi

if [ ! -d "$HOME/.local/src/dwl" ]; then
	git clone --depth=1 https://codeberg.org/amritxyz/dwl.git "$HOME/.local/src/dwl"
	sudo make -C $HOME/.local/src/dwl/ clean install
	success "Successfully installed DWL."
else
	warn "DWL already exists. Skipping."
fi

log "Installing Someblocks ..."

if [ ! -d "$HOME/.local/src/someblocks" ]; then
	git clone --depth=1 https://codeberg.org/amritxyz/someblocks.git "$HOME/.local/src/someblocks"
	sudo make -C $HOME/.local/src/someblocks/ clean install
	success "Successfully installed DWL."
else
	warn "Someblocks already exists. Skipping."
fi
