#!/bin/sh
# Lid switch handler for Hyprland (hyprlua config).
# Args: "on" (lid opened) | "off" (lid closed)

case "$1" in
    on)
        hyprctl eval 'hl.monitor({output="eDP-1", disabled=false})'
        ;;
    off)
        if hyprctl monitors -j | jq -e 'any(.name != "eDP-1" and (.disabled | not))' >/dev/null 2>&1; then
            hyprctl eval 'hl.monitor({output="eDP-1", disabled=true})'
        else
            systemctl suspend-then-hibernate
        fi
        ;;
esac
