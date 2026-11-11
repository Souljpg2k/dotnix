{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    obsidian
    loupe
    nvtopPackages.amd
    yazi
    kdePackages.dolphin

    zed-editor

    brave
    tor-browser

    nixfmt
    nixd
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

    cava
    obs-studio
    pavucontrol
    yt-dlp
    ffmpeg
    ffmpegthumbnailer
    playerctl

    wl-clipboard
    cliphist

    libnotify

    unzip
    unrar
    zip

    hyprshot
    hyprpicker
    hyprshutdown
    hyprpolkitagent

    quickshell
    qt6.qtsvg
    qt6.qtdeclarative

    bun
    go
    gh
    python3
    nodejs
    rustc
    cargo
    ninja
    cmake
    gcc
    pkg-config
    tree-sitter
  ];
}
