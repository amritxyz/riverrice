#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Copying dotfiles and personal rice..."

mkdir -p ~/.local/{share,state,bin,git-repos,hugo-dir,dox,vids,music,audio} ~/.config
mkdir -p ~/.local/state/bash

# Copy .config files
cp -r "$RICE_DIR/.config/"* "$HOME/.config"

# Copy local share
cp -r "$RICE_DIR/.local/share/"* "$HOME/.local/share"

# Copy local bin scripts
cp -r "$RICE_DIR/.local/bin/"* "$HOME/.local/bin"

# Shell and input config
ln -sfT "$HOME/.config/shell/bashrc" "$HOME/.bashrc"
ln -sfT "$HOME/.config/shell/profile" "$HOME/.profile"

# Move riverrice repo into ~/.local/git-repos
mkdir -p "$HOME/.local/git-repos"

# TLP Power-management config
sudo cp -r "$RICE_DIR/.local/share/99-power.conf" "/etc/tlp.d/99-power.conf"
log "Starting TLP service."
sudo systemctl start tlp.service
sudo systemctl enable tlp.service
sudo tlp start
