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
        "JetBrainsMono Nerd Font"
        "Tlwg Mono"
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
    sarabun-font
    tlwg
    kanit-font
    libre-baskerville
    material-symbols
  ];
}
