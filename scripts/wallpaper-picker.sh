#!/usr/bin/env bash

for cmd in awww awww-daemon magick; do
  command -v "$cmd" &>/dev/null || {
    rofi -e "Not found: $cmd"
    exit 1
  }
done

dir=~/Pictures/Wallpapers
[[ -d $dir ]] || {
  rofi -e "Folder not found: $dir"
  exit 1
}

thumbnailWidth=200
thumbnailHeight=150
thumbnailSize="${thumbnailWidth}x${thumbnailHeight}"
rounded=14

cache=~/.cache/wallpaper-thumbs/$thumbnailSize-$rounded
mask=$cache/mask.png
mkdir -p "$cache"

if [[ ! -f $mask ]]; then
  magick -size "$thumbnailSize" xc:black \
    -fill white \
    -draw "roundrectangle 0,0,$((thumbnailWidth - 1)),$((thumbnailHeight - 1)),$rounded,$rounded" \
    "$mask"
fi

shopt -s nullglob nocaseglob extglob
imgs=("$dir"/*.@(jpg|jpeg|png|gif|webp|bmp|tif|tiff|tga|pnm|pbm|pgm|ppm|avif|jxl|svg|ff))
((${#imgs[@]})) || {
  rofi -e "No images in $dir"
  exit 1
}

for t in "$cache"/*.png; do
  n=${t##*/}
  [[ $t == "$mask" || -f $dir/${n%.png} ]] || rm -f "$t"
done

theme="
    window { width: 70%; }
    listview { columns: 4; lines: 1; spacing: 16px; }
    element { orientation: vertical; padding: 0px 10px 10px 10px; }
    element-icon { size: ${thumbnailWidth}px; }
    element-text { horizontal-align: 0.5; }
"

current=$(awww query | sed -n 's/.*currently displaying: image: \(.*\)$/\1/p' | head -n 1)
selected=0
for i in "${!imgs[@]}"; do
  [[ ${imgs[i]} == "$current" ]] && {
    selected=$i
    break
  }
done

choice=$(
  for f in "${imgs[@]}"; do
    n=${f##*/}
    t=$cache/$n.png
    [[ $t -nt $f ]] || magick "$f[0]" -thumbnail "$thumbnailSize"^ -gravity center -extent "$thumbnailSize" \
      "$mask" -compose CopyOpacity -composite "$t"
    [[ -f $t ]] && printf '%s\0icon\x1f%s\n' "$n" "$t"
  done | rofi -dmenu -i -p "> " -selected-row "$selected" -theme-str "$theme"
)
[[ -n $choice ]] || exit 0

if ! awww query &>/dev/null; then
  setsid awww-daemon &>/dev/null &
  for _ in {1..25}; do
    awww query &>/dev/null && break
    sleep 0.2
  done
fi

awww img "$dir/$choice" \
  --transition-type random \
  --transition-fps 60 \
  --transition-duration 1
