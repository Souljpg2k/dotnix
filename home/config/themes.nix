{ pkgs, ... }:
let
  kvantumVariant = "mocha";
  kvantumAccent = "mauve";
  kvantumName = "catppuccin-${kvantumVariant}-${kvantumAccent}";
  kvantumPkg = pkgs.catppuccin-kvantum.override {
    variant = kvantumVariant;
    accent = kvantumAccent;
  };
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

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${kvantumName}
    '';
    "Kvantum/${kvantumName}".source = "${kvantumPkg}/share/Kvantum/${kvantumName}";
  };

  xdg.configFile."dolphinrc".text = ''
    MenuBar=Disabled

    [CompactMode]
    MaximumTextWidthIndex=2
    UseSystemFont=false

    [ContextMenu]
    ShowCopyMoveMenu=true

    [General]
    ModifiedStartupSettings=true
    ShowFullPath=true
    ShowStatusBar=FullWidth
    Version=202
    ViewPropsTimestamp=2026,8,23,23,29,45.034

    [IconsMode]
    UseSystemFont=false

    [KFileDialog Settings]
    Places Icons Auto-resize=false
    Places Icons Static Size=22

    [MainWindow]
    MenuBar=Disabled

    [UiSettings]
    ColorScheme=default
  '';
}
