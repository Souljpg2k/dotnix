{ pkgs, inputs, ... }:

{
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = [
        "SF Pro Display"
        "SF Pro Text"
        "Sarabun"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK SC"
        "Noto Sans CJK TC"
        "Noto Sans"
      ];

      serif = [
        "New York"
        "Noto Serif Thai"
        "Noto Serif CJK JP"
        "Noto Serif CJK KR"
        "Noto Serif CJK SC"
        "Noto Serif CJK TC"
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

  home.packages = with pkgs; [
    noto-fonts
    nerd-fonts.jetbrains-mono
    sarabun-font
    material-symbols
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-pro 
    inputs.apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.ny
  ];
}
