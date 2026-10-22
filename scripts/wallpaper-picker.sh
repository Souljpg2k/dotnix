#!/usr/bin/env bash

fail() {
    rofi -e "$1"
    exit 1
}

for cmd in awww awww-daemon magick; do
    if ! command -v "$cmd" &>/dev/null; then
        fail "Not found: $cmd"
    fi
done

dir=$HOME/Pictures/Wallpapers
if [[ ! -d $dir ]]; then
    fail "Folder not found: $dir"
fi

shopt -s nullglob nocaseglob extglob
imgs=("$dir"/*.@(jpg|jpeg|png|gif|webp|bmp|tif|tiff|tga|pnm|pbm|pgm|ppm|avif|jxl|svg|ff))
if ((${#imgs[@]} == 0)); then
    fail "No images in $dir"
fi

thumbnailWidth=200
thumbnailHeight=150
thumbnailSize="${thumbnailWidth}x${thumbnailHeight}"
rounded=12

cache=$HOME/.cache/wallpaper-thumbs/$thumbnailSize-$rounded
mask=$cache/mask.png
mkdir -p "$cache"

if [[ ! -f $mask ]]; then
    magick -size "$thumbnailSize" xc:black \
        -fill white \
        -draw "roundrectangle 0,0,$((thumbnailWidth - 1)),$((thumbnailHeight - 1)),$rounded,$rounded" \
        "$mask"
fi

for thumb in "$cache"/*.png; do
    name=${thumb##*/}
    if [[ $thumb != "$mask" && ! -f $dir/${name%.png} ]]; then
        rm -f "$thumb"
    fi
done

maxJobs=$(nproc)
for img in "${imgs[@]}"; do
    thumb=$cache/${img##*/}.png
    if [[ $thumb -nt $img ]]; then
        continue
    fi

    magick -define jpeg:size="$thumbnailSize" "$img[0]" \
        -thumbnail "$thumbnailSize"^ -gravity center -extent "$thumbnailSize" \
        "$mask" -compose CopyOpacity -composite "$thumb" &

    if (($(jobs -rp | wc -l) >= maxJobs)); then
        wait -n
    fi
done
wait

if ! awww query &>/dev/null; then
    setsid awww-daemon &>/dev/null &
    for _ in {1..25}; do
        if awww query &>/dev/null; then
            break
        fi
        sleep 0.2
    done
fi

current=$(awww query | sed -n 's/.*currently displaying: image: \(.*\)$/\1/p' | head -n 1)
selected=0
for i in "${!imgs[@]}"; do
    if [[ ${imgs[i]} == "$current" ]]; then
        selected=$i
        break
    fi
done

theme="
    window { 
        width: 70%; 
    }
    listview { 
        columns: 4; 
        lines: 1; 
        spacing: 16px; 
    }
    element { 
        orientation: vertical; 
        padding: 0px 10px 10px 10px; 
    }
    element-icon { 
        size: ${thumbnailWidth}px; 
    }
    element-text { 
        horizontal-align: 0.5; 
    }
"

choice=$(
    for img in "${imgs[@]}"; do
        name=${img##*/}
        thumb=$cache/$name.png
        if [[ -f $thumb ]]; then
            printf '%s\0icon\x1f%s\n' "$name" "$thumb"
        fi
    done | rofi -dmenu -i -p "> " -selected-row "$selected" -theme-str "$theme"
)
if [[ -z $choice ]]; then
    exit 0
fi

awww img "$dir/$choice" \
    --transition-type random \
    --transition-fps 60 \
    --transition-duration 1