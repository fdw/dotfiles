#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    export TRAY_POSITION=none
    if [[ $m == "eDP1" ]]; then
        TRAY_POSITION=right
    fi
    MONITOR=$m polybar --reload powerbar &
done
