{ config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/dotnix/home/config/hypr/hyprland.lua";
in
{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprsunset.nix
  ];
  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprlua;
}
