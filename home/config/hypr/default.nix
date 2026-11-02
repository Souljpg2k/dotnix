{ pkgs, config, ... }:
let
  hyprlua = "${config.home.homeDirectory}/dotnix/home/config/hypr/hyprland.lua";
in
{
  xdg.configFile."hypr/hyprland.lua".source = config.lib.file.mkOutOfStoreSymlink hyprlua;
  xdg.configFile."hyprland-per-window-layout/options.toml".text = ''
    keyboards = [
      "lizhi-flash-ic-usb-keyboard",
    ]

    [[default_layouts]]
    0 = [
      "kitty",
      "com.mitchellh.ghostty",
      "code",
    ]
    1 = [
      "zen-beta",
      "brave-browser",
    ]
  '';

  home.packages = with pkgs; [
    hyprland-per-window-layout
  ];
}
