#!/usr/bin/env bash

CHOICE=$(
  printf '%s\n' \
    " 󰐥  Shutdown" \
    " 󰜉  Reboot" \
    " 󰤄  Suspend" \
    " 󰒲  Hibernate" \
    " 󰍃  Logout" \
    " 󰌾  Lockscreen" |
    rofi -dmenu -p "> " -no-show-icons -theme-str 'mainbox { children: [ listview ]; }'
)

confirm() {
  [[ $(printf '%s\n' "No" "Yes" | rofi -dmenu -p "$1? " -no-show-icons -i -theme-str 'element-text { padding: 5px; }') == "Yes" ]]
}

case "$CHOICE" in
*Shutdown)
  confirm "Shutdown" && systemctl poweroff
  ;;
*Reboot)
  confirm "Reboot" && systemctl reboot
  ;;
*Suspend)
  systemctl suspend
  ;;
*Hibernate)
  confirm "Hibernate" && systemctl hibernate
  ;;
*Logout)
  confirm "Logout" && hyprctl dispatch 'hl.dsp.exit()'
  ;;
*Lockscreen)
  if ! command -v hyprlock &>/dev/null; then
    rofi -e "hyprlock is not installed"
    exit 1
  fi
  pidof hyprlock || hyprlock
  ;;
esac