#!/usr/bin/env bash

title="Hyprlock"
message="is not installed ):"

if ! command -v hyprlock &>/dev/null; then
    notify-send "$title" "$message"
    echo "$title $message"
    exit 1
fi

if pidof hyprlock >/dev/null; then
    exit 0
fi

if out=$(awww query 2>/dev/null); then
    img=$(grep -m1 'image:' <<<"$out" | sed 's/.*image: //')
fi

if [[ ! -f $img ]]; then
    img="./Wallpapers/wall0.png"
fi

export HYPRLAND_WALLPAPER="$img"

exec hyprlock "$@"