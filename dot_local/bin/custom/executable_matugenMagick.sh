#!/usr/bin/env bash
#  ┳┳┓┏┓┏┳┓┳┳┏┓┏┓┳┓  ┳┳┓┏┓┏┓┳┏┓┓┏┓
#  ┃┃┃┣┫ ┃ ┃┃┃┓┣ ┃┃━━┃┃┃┣┫┃┓┃┃ ┃┫ 
#  ┛ ┗┛┗ ┻ ┗┛┗┛┗┛┛┗  ┛ ┗┛┗┗┛┻┗┛┛┗┛
#                                 




# utility vars
# current_monitor=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
current_monitor=$(niri msg --json focused-output | jq -r '.name')
# Ask awww directly: the old ~/.cache/swww cache is no longer updated since swww -> awww
# awww query output: ": eDP-1: 2048x1152, scale: 1.25, currently displaying: image: /path"
wallpaper_path=$(awww query | grep -F ": $current_monitor:" | sed -n 's/.*currently displaying: image: //p')

echo "wallpaper path : $wallpaper_path"
[ -f "$wallpaper_path" ] || { echo "wallpaper not found for $current_monitor" >&2; exit 1; }
# generate matugen colors (--source-color-index 0 skips the interactive color prompt)
if [ "$1" == "--light" ]; then
  matugen image "$wallpaper_path" -m "light" --source-color-index 0 --show-colors --debug
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
  matugen image "$wallpaper_path" -m "dark" --source-color-index 0 --show-colors --debug
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi 

# set gtk theme
# gsettings set org.gnome.desktop.interface gtk-theme ""
# gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3

#-------Imagemagick magick 👀--------------#
wait $!

# convert and resize the current wallpaper & make it image for rofi with blur
 magick "$wallpaper_path" -strip -resize 1000 -gravity center -extent 1000 -blur "30x30" -quality 90 $HOME/.config/rofi/images/currentWalBlur.thumb

# convert and resize the current wallpaper & make it image for rofi without blur
magick "$wallpaper_path" -strip -resize 1000 -gravity center -extent 1000 -quality 90 $HOME/.config/rofi/images/currentWal.thumb

# convert and resize the current wallpaper & make it image for rofi with square format
magick "$wallpaper_path" -strip -thumbnail 500x500^ -gravity center -extent 500x500 $HOME/.config/rofi/images/currentWal.sqre

# convert and resize the square formatted & make it image for rofi with drawing polygon
magick $HOME/.config/rofi/images/currentWal.sqre \( -size 500x500 xc:white -fill "rgba(0,0,0,0.7)" -draw "polygon 400,500 500,500 500,0 450,0" -fill black -draw "polygon 500,500 500,0 450,500" \) -alpha Off -compose CopyOpacity -composite $HOME/.config/rofi/images/currentWalQuad.png && mv $HOME/.config/rofi/images/currentWalQuad.png $HOME/.config/rofi/images/currentWalQuad.quad


# copy the wallpaper in current-wallpaper file
wait $!
cp -r "$wallpaper_path" "$HOME/.current_wallpaper"

# send notification after completion
wait $!
notify-send -e -h string:x-canonical-private-synchronous:matugen_notif "MatugenMagick" "Matugen & ImageMagick has completed its job" -i $HOME/.current_wallpaper
