{ config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/nixos/modules/config/hypr/hyprland.lua";
in
{
  home.username = "arx";
  home.homeDirectory = "/home/arx";
  home.stateVersion = "26.05";

  imports = [
    ./modules/config
    ./modules/pkgs
  ];

  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprlua;

  programs.home-manager.enable = true;
}