#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=eDP-1 polybar mybar &
MONITOR=HDMI-1 polybar mybar &
MONITOR=VGA-1 polybar mybar

echo "Bars launched..."
