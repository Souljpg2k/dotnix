{ config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/nixos/home/config/hypr/hyprland.lua";
in
{
  home.username = "arx";
  home.homeDirectory = "/home/arx";
  home.stateVersion = "26.05";

  imports = [
    ./config
    ./pkgs
  ];

  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprlua;

  programs.home-manager.enable = true;
}