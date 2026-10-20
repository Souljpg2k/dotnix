{ pkgs, ... }:
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
    enable = true;
    theme = {
      package = pkgs.colloid-gtk-theme.override {
        themeVariants = [ "grey" ];
        colorVariants = [ "light" ];
        sizeVariants = [ "standard" ];
        tweaks = [ "catppuccin" ];
      };
      name = "Colloid-Grey-Light-Catppuccin";
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-light";
    };

    font = {
      name = "SF Pro Display";
      size = 12;
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
}