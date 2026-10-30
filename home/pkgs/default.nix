{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    obsidian
    loupe
    kdePackages.dolphin

    vscode
    vim

    brave
    tor-browser

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

    qt6.qtdeclarative

    bun
    go
    python3
    kotlin
    jdk
    nodejs
    rustc
    cargo
    ninja
    gcc
    pkg-config
    tree-sitter
  ];
}
