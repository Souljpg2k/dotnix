{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    obsidian
    loupe
    kdePackages.dolphin

    zed-editor
    zed-discord-presence

    brave
    tor-browser

    nixfmt
    nixd
    nil
    statix

    shfmt
    prettier
    ruff
    black
    stylua
    lua-language-server

    fzf
    tree
    ripgrep
    psmisc

    color-lsp

    cava
    yazi
    nvtopPackages.amd

    obs-studio
    pwvucontrol
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
