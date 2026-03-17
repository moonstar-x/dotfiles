#!/bin/bash

set -euo pipefail

TYPE="$1"
JSON_FILE="$2"

if [[ -z "${JSON_FILE:-}" ]]; then
  echo "Usage $0 <AppStore|Casks|Packages|Custom> <json_file>"
  exit 1
fi

if [[ "$TYPE" == "AppStore" ]]; then
  echo "Installing AppStore packages.."

  while read -r key value; do
    echo "@AppStore - Installing $key"

    mas install $value
  done < <(jq -r '.AppStore | to_entries[] | "\(.key) \(.value)"' "$JSON_FILE")
fi

if [[ "$TYPE" == "Casks" ]]; then
  echo "Installing casks..."

  while read -r key value; do
    echo "@Cask - Installing $key"

    brew install --cask $value
  done < <(jq -r '.Casks | to_entries[] | "\(.key) \(.value)"' "$JSON_FILE")
fi

if [[ "$TYPE" == "Packages" ]]; then
  echo "Installing packages..."
  
  while read -r key value; do
    echo "@Package - Installing $key"

    brew install "$value" </dev/null
  done < <(jq -r '.Packages | to_entries[] | "\(.key) \(.value)"' "$JSON_FILE")
fi

if [[ "$TYPE" == "Custom" ]]; then
  echo "Installing custom packages..."

  while read -r key value; do
    echo "@Custom - Installing $key"

    ./install-custom.sh "$value"
  done < <(jq -r '.Custom | to_entries[] | "\(.key) \(.value)"' "$JSON_FILE")
fi
