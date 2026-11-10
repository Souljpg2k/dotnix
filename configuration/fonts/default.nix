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
  fonts.packages = [
    google-sans-flex
  ];
}
