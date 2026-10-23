{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Inter"
        "Noto Sans Thai"
        "Kanit"
        "Sarabun"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK SC"
        "Noto Sans CJK TC"
        "Noto Sans"
      ];
      serif = [
        "Libre Baskerville"
        "Noto Serif Thai"
        "Noto Serif CJK JP"
        "Noto Serif CJK KR"
        "Noto Serif CJK SC"
        "Noto Serif CJK TC"
        "Noto Serif"
      ];
      monospace = [
        "DejaVu Sans Mono"
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
    dejavu_fonts
    sarabun-font
    kanit-font
    libre-baskerville
    material-symbols
  ];
}
