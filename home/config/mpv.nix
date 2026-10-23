{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
    ];
    config = {
      keep-open = "yes";
      loop-playlist = "yes";
    };
  };
}