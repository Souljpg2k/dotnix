#!/usr/bin/env bash

wal=~/.cache/hyprlock-wallpaper
fallback=~/nixos/Wallpaper/default.jpg

image=$(awww query 2>/dev/null | sed -n 's/.*currently displaying: image: \(.*\)$/\1/p' | head -n 1)

shopt -s nocasematch extglob
[[ -f $image && $image == *.@(png|jpg|jpeg|webp) ]] || image=$fallback

ln -sfn "$image" "$wal"
exec hyprlock "$@"
