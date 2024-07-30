#!/bin/bash

hyprctl notify 1 1000 blue "Exit window mode"
hyprctl dispatch submap reset 
hyprctl keyword decoration:active_opacity 0.9
