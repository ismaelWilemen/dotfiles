#!/bin/bash

# HYPRLAND
hyprctl reload

# WAYBAR
pkill waybar
pkill cava
sleep 0.3
waybar &

# MAKO (notificações)
pkill mako
mako &

# WOFI (não precisa, mas garante)
pkill wofi 2>/dev/null

# WLOGOUT (não precisa manter aberto)
pkill wlogout 2>/dev/null
