{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    discord
    vscode
    obs-studio
    pavucontrol
    loupe
    obsidian
    upscayl
    kdePackages.dolphin

    brave
    tor-browser
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

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

    awww
    imagemagick
    hyprshot
    hyprpicker
    hyprsunset
    hyprshutdown
    hyprpolkitagent
    quickshell
    qt6.qtdeclarative
    qt6.qtimageformats
    qt6.qtmultimedia

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