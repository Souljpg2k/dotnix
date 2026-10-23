{ pkgs, ... }:
let
  theme = {
    package = pkgs.catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "standard";
      variant = "mocha";
    };
    name = "catppuccin-mocha-mauve-standard";
  };
  iconTheme = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
  };
  font = {
    name = "Inter";
    size = 12;
  };
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  gtk = {
    inherit theme iconTheme font;
    enable = true;
    gtk4 = {
      inherit theme iconTheme font;
    };
  };

  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    icon_theme=WhiteSur-light
    style=kvantum
  '';
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=KvGnomeAlt
  '';
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
