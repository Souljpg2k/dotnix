{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    nixfmt
    nil
    prettierd
    ruff
    fzf
    tree
    ripgrep
    psmisc
    yt-dlp
    ffmpeg
    ffmpegthumbnailer
    playerctl
    wl-clipboard
    cliphist
    libnotify
    unzip
    zip
  ];
}