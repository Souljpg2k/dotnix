{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        namespace = "fuzzel";
        font = "Inter:weight=medium:size=15";
        dpi-aware = "yes";
        terminal = "kitty -1";
        anchor = "top";
        layer = "overlay";
        y-margin = 10;
        width = 25;
        horizontal-pad = 20;
        vertical-pad = 15;
        inner-pad = 10;
      };
      colors = {
        background = "#f8f6fbff";
        text = "#a8a8a8ff";
        message = "#6cc9ffff";
        match = "#6cc9ffff";
        selection = "#e5e7efff";
        selection-text = "#5f5f5fff";
        selection-match = "#a4a2ffff";
      };
      border = {
        width = 0;
        radius = 18;
        selection-radius = 8;
      };
    };
  };
}