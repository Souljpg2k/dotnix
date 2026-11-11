{ pkgs, inputs, ... }:
let
  app-menu = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
in
{
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    trusted-users = ["root" "@wheel"];
  };

  environment.etc."xdg/menus/applications.menu".source = app-menu;
  xdg.mime.defaultApplications = {
    "inode/directory" = "org.kde.dolphin.desktop";
  };

  security.pam.services.hyprlock = { };

  services.upower.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.colord.enable = true;

  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];
}
