{ pkgs, ... }:
let
  google-sans-flex = pkgs.stdenvNoCC.mkDerivation {
    pname = "google-sans-flex";
    version = "1.0";
    src = ./GoogleSansFlex/GoogleSansFlex.ttf;
    dontUnpack = true;
    installPhase = ''
      install -Dm644 $src $out/share/fonts/truetype/GoogleSansFlex.ttf
    '';
    meta = {
      description = "Google Sans Flex variable font";
      license = pkgs.lib.licenses.ofl;
    };
  };
in
{
  fonts.packages = with pkgs; [
    google-sans-flex
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
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Google Sans Flex"
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
