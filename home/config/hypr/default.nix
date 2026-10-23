{ config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/dotnix/home/config/hypr/hyprland.lua";
in
{
  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprlua;
}