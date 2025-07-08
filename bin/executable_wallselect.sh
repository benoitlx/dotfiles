#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers/"

CWD="$(pwd)"

cd "$WALL_DIR" || exit 1

# to handle spaces in filenames
IFS=$'\n'

# TODO
# - increase icon size depending on the screen resolution
# - change rofi color with matugen

SELECTED_WALL=$(for a in *.jpg; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "" -theme "~/.config/rofi/applets/wallSelect.rasi")

matugen image "$WALL_DIR/$SELECTED_WALL" -m "light"

cd "$CWD" || exit 1
