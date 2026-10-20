{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    brave
    tor-browser
    discord
    vscode
    obs-studio
    pavucontrol
    loupe
    obsidian
    upscayl
    kdePackages.dolphin
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}