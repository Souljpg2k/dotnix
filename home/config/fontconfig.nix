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
        "Hack Nerd Font"
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
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    kanit-font
    libre-baskerville
    material-symbols
  ];
}
