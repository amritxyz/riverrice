#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

TMP_DIR=/opt/void
PRAC_DIRS=$TMP_DIR/prac

if [ -d "$TMP_DIR" ]; then
	warn "$TMP_DIR Exists.."
else
	log "Creating tmp env in /opt dir..."
	sudo mkdir $TMP_DIR
	sudo chown $USER:$USER $TMP_DIR
	mkdir $TMP_DIR/git-repos
	mkdir $PRAC_DIRS/{clang,zig,class,rust,go,java,python,js,typst,latex}
	success "Successfully Created tmp env with prac dir..."
fi
