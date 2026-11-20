{ config, pkgs, ... }:
let
  theme = {
    package = pkgs.adw-gtk3;
    name = "adw-gtk3-dark";
  };
  iconTheme = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
  };
  font = {
    name = "Roboto";
    size = 12;
  };
  qtAppearance = {
    color_scheme_path = "~/.config/themes/qtct-colors.conf";
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
    qt5ctSettings = {
      Appearance = qtAppearance;
    };
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

  xdg.configFile = {
    "gtk-3.0/gtk.css".text = ''
      @import '../themes/gtk-colors.css';
    '';
    "gtk-4.0/gtk.css".text = ''
      @import '../themes/gtk-colors.css';
    '';
    "themes/gtk-colors.css".text = ''
      :root {
        --accent-bg-color: #97ccf9;
        --accent-fg-color: #001e30;
      }
      @define-color accent_color #97ccf9;
      @define-color accent_fg_color #001e30;
      @define-color accent_bg_color #97ccf9;
      @define-color window_bg_color #101417;
      @define-color window_fg_color #e0e3e8;
      @define-color headerbar_bg_color #101417;
      @define-color headerbar_fg_color #e0e3e8;
      @define-color popover_bg_color #101417;
      @define-color popover_fg_color #e0e3e8;
      @define-color view_bg_color #101417;
      @define-color view_fg_color #e0e3e8;
      @define-color card_bg_color #101417;
      @define-color card_fg_color #e0e3e8;
      @define-color sidebar_bg_color @window_bg_color;
      @define-color sidebar_fg_color @window_fg_color;
      @define-color sidebar_border_color @window_bg_color;
      @define-color sidebar_backdrop_color @window_bg_color;
    '';
  };

  xdg.configFile = {
    "qt6ct/qss/dolphin.qss".text = ''
      QToolBar { border: none; }
      KUrlNavigator { background: transparent; }
      QFrame { border: none; }
      QAbstractScrollArea { border: none; }
    '';
    "dolphinrc".text = ''
      [ContextMenu]
      ShowCopyMoveMenu=true

      [UiSettings]
      ColorScheme=default
    '';
    "themes/qtct-colors.conf".text = ''
      [ColorScheme]
      active_colors=#e0e3e8, #101417, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #e0e3e8, #ffffff, #e0e3e8, #101417, #101417, #000000, #97ccf9, #cbe6ff, #b8c8d9, #97ccf9, #101417, #000000, #101417, #e0e3e8, #b8c8d9
      disabled_colors=#e0e3e8, #101417, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #e0e3e8, #ffffff, #e0e3e8, #101417, #101417, #000000, #97ccf9, #cbe6ff, #b8c8d9, #97ccf9, #101417, #000000, #101417, #e0e3e8, #b8c8d9
      inactive_colors=#e0e3e8, #101417, #ffffff, #cacaca, #9f9f9f, #b8b8b8, #e0e3e8, #ffffff, #e0e3e8, #101417, #101417, #000000, #97ccf9, #cbe6ff, #b8c8d9, #97ccf9, #101417, #000000, #101417, #e0e3e8, #b8c8d9
    '';
  };
}
