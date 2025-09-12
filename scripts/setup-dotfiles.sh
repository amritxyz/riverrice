#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Copying dotfiles and personal rice..."

mkdir -p ~/.local/{share,state,bin,git-repos,hugo-dir,dox,vids,music,audio} ~/.config

# Copy .config files
cp -r "$RICE_DIR/.config/"* "$HOME/.config"

# Copy local share
cp -r "$RICE_DIR/.local/share/"* "$HOME/.local/share"

# Copy local bin scripts
cp -r "$RICE_DIR/.local/bin/"* "$HOME/.local/bin"

# Shell and input config
cp "$RICE_DIR/.profile" "$HOME/.profile"
ln -sfT "$HOME/.config/bash/bashrc" "$HOME/.bashrc"

# Move riverrice repo into ~/.local/git-repos
mkdir -p "$HOME/.local/git-repos"
