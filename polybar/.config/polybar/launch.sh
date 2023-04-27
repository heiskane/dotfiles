#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
/usr/bin/polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m /usr/bin/polybar --reload mainbar &
  done
else
  polybar --reload mainbar &
fi

echo "Bars launched..."
