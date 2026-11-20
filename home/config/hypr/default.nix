{ config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/dotnix/home/config/hypr";
in
{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprsunset.nix
  ];

  services = {
    hyprpolkitagent.enable = true;
    awww.enable = true;
  };

  xdg.configFile = {
    "hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink "${hyprlua}/hyprland.lua";
    "hypr/hyprland".source = config.lib.file.mkOutOfStoreSymlink "${hyprlua}/hyprland";
  };
}
