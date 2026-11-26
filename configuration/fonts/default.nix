{ pkgs, ... }:
{
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
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
  fonts.packages = with pkgs; [
    inter
    roboto
    oswald
    poppins
    noto-fonts
    nerd-fonts.jetbrains-mono
    kanit-font
    libre-baskerville
    material-symbols
  ];
}
