#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

IFS=$'\n'
for entry in $(xrandr --query | grep " connected"); do
  mon=$(cut -d" " -f1 <<< "$entry")
  status=$(cut -d" " -f3 <<< "$entry")

  tray_pos=""
  if [ "$status" == "primary" ]; then
    MONITOR=$mon polybar --reload primary &
  else
    MONITOR=$mon polybar --reload secondary &
  fi

done
unset IFS
