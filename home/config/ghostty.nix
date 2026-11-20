{
  programs.ghostty = {
    enable = true;
    settings = {
      alpha-blending = "native";
      background-opacity = 0.5;
      bell-features = "no-title";
      command = "fish";
      copy-on-select = true;
      cursor-style = "block";
      cursor-style-blink = true;
      confirm-close-surface = false;
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      shell-integration-features = "no-cursor";
      window-padding-x = 26;
      window-padding-y = 26;
      foreground = "#e0e3e8";
      background = "#101417";
      cursor-color = "#b8c8d9";
      selection-background = "#b8c8d9";
      palette = [
        "0=#41474d"
        "1=#ffb4ab"
        "2=#d0bfe7"
        "3=#b8c8d9"
        "4=#97ccf9"
        "5=#d0bfe7"
        "6=#b8c8d9"
        "7=#c1c7ce"
        "8=#8b9198"
        "9=#ffdad6"
        "10=#ecdcff"
        "11=#d4e4f6"
        "12=#cbe6ff"
        "13=#ecdcff"
        "14=#d4e4f6"
        "15=#e0e3e8"
      ];
    };
  };
}
