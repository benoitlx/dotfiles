#!/bin/sh
# Bridge: Flatpak Firefox -> host pywalfox daemon
exec flatpak-spawn --host /usr/bin/python3 -m pywalfox start
