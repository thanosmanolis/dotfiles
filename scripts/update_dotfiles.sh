#!/bin/bash

DOTFILES="$HOME/dotfiles"
CONFIG="$HOME/.config"
HOME_DIR="$HOME"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}Updating dotfiles...${NC}\n"

# ── .config folders ────────────────────────────────────────────────────────────
echo -e "${BLUE}Checking ~/.config folders...${NC}"
for config_dir in "$CONFIG"/*/; do
    folder_name=$(basename "$config_dir")
    dotfiles_dir="$DOTFILES/$folder_name"

    if [ -d "$dotfiles_dir" ]; then
        cp -r "$config_dir"* "$dotfiles_dir/" 2>/dev/null
        echo -e "  ${GREEN}✔${NC} $folder_name"
    else
        echo -e "  ${YELLOW}–${NC} $folder_name (not in dotfiles, skipping)"
    fi
done

echo ""

# ── home folder single files ───────────────────────────────────────────────────
echo -e "${BLUE}Checking ~/ files...${NC}"
for home_file in "$HOME_DIR"/.[^.]* "$HOME_DIR"/*; do
    [ -f "$home_file" ] || continue
    file_name=$(basename "$home_file")
    dotfiles_file="$DOTFILES/$file_name"

    if [ -f "$dotfiles_file" ]; then
        cp "$home_file" "$dotfiles_file"
        echo -e "  ${GREEN}✔${NC} $file_name"
    else
        echo -e "  ${YELLOW}–${NC} $file_name (not in dotfiles, skipping)"
    fi
done

echo -e "\n${GREEN}Done!${NC}"
