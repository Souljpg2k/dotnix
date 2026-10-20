{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awww
    imagemagick
    hyprshot
    hyprpicker
    hyprsunset
    hyprshutdown
    hyprpolkitagent
    quickshell
    qt6.qtdeclarative
    qt6.qtimageformats
    qt6.qtmultimedia
  ];
}
