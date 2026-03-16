#!/bin/bash

SCRIPTS_DIR="$(pwd)"
DOTFILES_ROOT="$(realpath "$SCRIPTS_DIR/../..")"
CONFIG_DIR="$DOTFILES_ROOT/config"

XDG_CONFIG_HOME="$HOME/Library/Application Support"
LINUX_XDG_CONFIG_HOME="$HOME/.config"

echo "Linking config for btop"
rm -r $LINUX_XDG_CONFIG_HOME/btop/btop.conf $LINUX_XDG_CONFIG_HOME/btop/themes
ln -sf "$CONFIG_DIR/btop/btop.conf" "$LINUX_XDG_CONFIG_HOME/btop/btop.conf"
ln -sf "$CONFIG_DIR/btop/themes" "$LINUX_XDG_CONFIG_HOME/btop/themes"

echo "Linking config for ghostty"
ln -sf "$CONFIG_DIR/ghostty/config" "$XDG_CONFIG_HOME/com.mitchellh.ghostty/config"

echo "Linking config for jellyfin-tui"
ln -sf "$CONFIG_DIR/jellyfin-tui/config.yaml" "$XDG_CONFIG_HOME/jellyfin-tui/config.yaml"

echo "Linking config for starship"
ln -sf "$CONFIG_DIR/starship/config.toml" "$LINUX_XDG_CONFIG_HOME/starship.toml"

echo "Linking config for zsh"
ln -sf "$CONFIG_DIR/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"
