{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    nil
    statix
    shfmt
    prettier
    ruff
    stylua
    black
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
