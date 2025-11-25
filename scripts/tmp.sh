#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

TMP_DIR=/opt/void
PRAC_DIRS=$TMP_DIR/prac
GIT_REP=$TMP_DIR/git-repos
BAK_DIR=$TMP_DIR/bak

if [ -d "$TMP_DIR" ]; then
	warn "$TMP_DIR Exists..."
else
	log "Creating tmp env in /opt dir..."
	sudo mkdir -p $TMP_DIR
	sudo chown $USER:$USER $TMP_DIR
	success "Successfully Created tmp env with prac dir..."
fi

# INFO: Bak dir
if [ ! -d "$BAK_DIR" ]; then
	mkdir -p $BAK_DIR
else
	warn "$BAK_DIR Exists..."
fi

# INFO: Prac dirs
# if [ ! -d "$PRAC_DIRS" ]; then
# 	mkdir -p $PRAC_DIRS/{clang,zig,class,rust,go,java,python,js,typst,latex}
# else
# 	warn "$PRAC_DIRS Exists..."
# fi

# INFO: Git repos
if [ ! -d "$GIT_REP" ]; then
	mkdir -p $GIT_REP
else
	warn "$GIT_REP Exist..."
fi
