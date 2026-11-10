{ pkgs, ... }:
{
  programs.starship.enable = true;

  xdg.configFile."starship.toml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Souljpg2k/dots-hyprland/2f2a376fdb2ad738bf55f693dd0b474b64bb0ab8/dots/.config/starship.toml";
    hash = "sha256-vbQZ7dCmNkIQLwMo1IILhSG4kp9cKJo2PEZK9oAkxrU=";
  };
}
