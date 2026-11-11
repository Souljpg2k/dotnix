{ config, pkgs, ... }:
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
    name = "Google Sans Flex";
    size = 12;
  };
  qtAppearance = {
     color_scheme_path = "$HOME/.local/state/caelestia/theme/qtct-colors.conf";
     custom_palette = true;
     style = "Fusion";
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
    style.name = qtAppearance.style;

    qt5ctSettings.Appearance = qtAppearance;
    qt6ctSettings = {
      Appearance = qtAppearance;
      Interface.stylesheets = "${config.xdg.configHome}/qt6ct/qss/dolphin.qss";
    };
  };

  gtk = {
    enable = true;
    inherit theme iconTheme font;

    gtk4 = { inherit theme iconTheme font; };
  };

  xdg.configFile."qt6ct/qss/dolphin.qss".text = ''
    QToolBar { border: none; }
    KUrlNavigator { background: transparent; }
    QFrame { border: none; }
    QAbstractScrollArea { border: none; }
  '';

  xdg.configFile."dolphinrc".text = ''
    [ContextMenu]
    ShowCopyMoveMenu=true

    [UiSettings]
    ColorScheme=default
  '';

  xdg.configFile."kdeglobals".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.local/state/caelestia/theme/kdeglobals.conf";
}
