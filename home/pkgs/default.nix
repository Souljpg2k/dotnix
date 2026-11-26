{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    loupe
    obsidian

    kdePackages.dolphin
    yazi

    neovim
    zed-discord-presence
    zed-editor

    nil
    nixd
    nixfmt
    statix

    black
    prettier
    ruff
    shfmt
    stylua

    nvtopPackages.amd

    fzf
    psmisc
    ripgrep
    tree

    ffmpeg
    ffmpegthumbnailer
    obs-studio
    playerctl
    pwvucontrol
    yt-dlp

    cliphist
    libnotify
    wl-clipboard

    gnutar
    unrar
    unzip
    zip

    hyprpicker
    hyprshot
    hyprshutdown

    quickshell
    qt6.qtdeclarative

    bun
    cargo
    cmake
    gcc
    gh
    go
    gopls
    ninja
    nodejs
    pkg-config
    python3
    basedpyright
    rustc
    tree-sitter
    typescript
    typescript-language-server
    vscode-langservers-extracted
    astro-language-server
    emmet-language-server
    lua-language-server
    bash-language-server
  ];
}
