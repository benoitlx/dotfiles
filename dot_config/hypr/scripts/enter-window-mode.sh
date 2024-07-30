#!/bin/bash

hyprctl notify 1 1000 blue "Enter window mode"
hyprctl dispatch submap window-mode  
hyprctl keyword decoration:active_opacity 0.1
