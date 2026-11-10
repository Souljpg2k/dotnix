{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Inter"
        "Kanit"
      ];
      serif = [
        "Libre Baskerville"
        "Noto Serif"
      ];
      monospace = [
        "Iosevka Nerd Font"
        "JetBrainsMono Nerd Font"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };
  };

  home.packages = with pkgs; [
    inter
    oswald
    poppins
    noto-fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    kanit-font
    libre-baskerville
    material-symbols
  ];
}
