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
        background = "#11111bff";
        text = "#cdd6f4ff";
        message = "#89dcebff";
        match = "#89b4faff";
        selection = "#45475aff";
        selection-text = "#cdd6f4ff";
        selection-match = "#cba6f7ff";
      };
      border = {
        width = 0;
        radius = 18;
        selection-radius = 8;
      };
    };
  };
}