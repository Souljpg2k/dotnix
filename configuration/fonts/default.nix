{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    inter
    roboto
    oswald
    poppins
    noto-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    kanit-font
    libre-baskerville
    material-symbols
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Roboto"
        "Inter"
        "Kanit"
      ];
      serif = [
        "Libre Baskerville"
        "Noto Serif"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Iosevka Nerd Font"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
}
