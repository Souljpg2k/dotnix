{ pkgs, ... }:
let
  rwall = pkgs.writeShellApplication {
    name = "rwall";
    runtimeInputs = with pkgs; [
      findutils
      coreutils
      awww
    ];
    text = ''
      dir="$HOME/Pictures/Wallpapers"

      if [[ ! -d "$dir" ]]; then
          echo "No such directory: $dir" >&2
          exit 1
      fi

      wallpaper=$(find "$dir" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' \) | shuf -n 1)

      if [[ -z "$wallpaper" ]]; then
          echo "No wallpapers found" >&2
          exit 1
      fi

      awww img "$wallpaper" --transition-fps 60 --transition-duration 2 --transition-type random
    '';
  };

  lock = pkgs.writeShellApplication {
    name = "lock";
    runtimeInputs = with pkgs; [
      awww
      hyprlock
      gnused
      coreutils
    ];
    text = ''
      if ! query="$(awww query)"; then
          echo "Failed to query awww" >&2
          exit 1
      fi

      wall="$(printf '%s\n' "$query" | sed -nE 's/.*image: (.*)$/\1/p; /image: /q')"

      if [[ -z "$wall" || ! -f "$wall" ]]; then
          echo "No wallpaper found" >&2
          exit 1
      fi

      export WALLPAPER="$wall"
      exec hyprlock
    '';
  };
in
{
  services.awww.enable = true;
  home.packages = [
    rwall
    lock
  ];
}
