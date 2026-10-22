{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    go
    python3
    nodejs
    rustc
    cargo
    ninja
    gcc
    pkg-config
    tree-sitter
  ];
}