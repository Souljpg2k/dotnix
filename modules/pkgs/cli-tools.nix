{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    neovim
    nixfmt
    nil
    prettierd
    ruff
    fzf
    tree
    ripgrep
    psmisc
    yazi
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