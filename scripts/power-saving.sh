#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

# TLP Power-management config
sudo cp -r "$RICE_DIR/.local/share/99-power.conf" "/etc/tlp.d/99-power.conf"

log "Starting TLP service."

sudo systemctl start tlp.service
sudo systemctl enable tlp.service
sudo tlp start

success "Successfully started TLP service."
