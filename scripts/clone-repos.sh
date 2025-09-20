#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Cloning personal repositories..."

# Clone dev tools repo
if [[ ! -d "$HOME/.local/dev" ]]; then
	git clone --depth=1 https://github.com/amritxyz/dev.git "$HOME/.local/dev"
	success "Cloned dev repo."
else
	warn "Dev repo already exists. Skipping."
fi

# Clone Neovim config
if [[ ! -d "$HOME/.config/nvim" ]]; then
	git clone --depth=1 https://github.com/amritxyz/kickstart-nvim.git "$HOME/.config/nvim"
	success "Cloned Neovim config."
else
	warn "Neovim config already exists. Skipping."
fi

# Move riverrice repo into ~/.local/git-repos
mv "$RICE_DIR" "$HOME/.local/git-repos/riverrice"

export XDG_STATE_HOME="$HOME/.local/state"
export HISTFILE="$XDG_STATE_HOME/bash/history"
mkdir -p "$XDG_STATE_HOME/bash"
rm -rf $HOME/.bash_history
rm -rf ~/.wget-hsts

echo
success "Dotfiles and rice successfully set up."
