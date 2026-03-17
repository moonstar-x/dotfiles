#!/bin/bash

cmd="$1"
shift

# Functions

jellyfin-tui() {
  echo "Installing jellyfin-tui"

  brew install mpv
  git clone https://github.com/dhonus/jellyfin-tui /tmp/jellyfin-tui
  cd /tmp/jellyfin-tui

  export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
  export PATH=$PATH:~/.cargo/bin/
  cargo install --path .

  rm -rf /tmp/jellyfin-tui
}

regex-tui() {
  echo "Installing regex-tui"

  go install github.com/vitor-mariano/regex-tui@latest
}

gh-dash() {
  echo "Installing gh-dash"

  gh extension install dlvhdr/gh-dash
}

posting() {
  echo "Installing posting"

  uv tool install --python 3.13 posting
}

# Runner

if declare -f "$cmd" > /dev/null; then
  "$cmd"
else
  echo "Unknown command: $cmd"
fi
