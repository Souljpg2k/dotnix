let
  colors = {
    bg = "rgb(17, 17, 27)";
    fg = "rgb(205, 214, 244)";
    time = "rgb(205, 214, 244)";
  };
  fonts = {
    family = "Inter";
    icon = "Material Symbols Outlined";
  };
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      background = [
        {
          monitor = "";
          path = "$WALLPAPER";
          brightness = 0.5;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "180, 35";
          outline_thickness = 2;
          dots_size = 0.4;
          dots_spacing = 0.4;
          dots_center = true;
          outer_color = "rgba(28, 28, 30, 0)";
          inner_color = colors.bg;
          font_color = colors.fg;
          fade_on_empty = false;
          placeholder_text = "<i>Enter password</i>";
          shadow_passes = 1;
          shadow_size = 2;
          shadow_boost = "1.0";

          position = "0, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:60000] LC_TIME=en_US.UTF-8 date '+%A, %B %d'";
          color = colors.time;
          font_size = 16;
          font_family = fonts.family;
          shadow_passes = 1;
          shadow_size = 3;
          shadow_boost = "0.8";

          position = "0, -60";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "$TIME";
          color = colors.time;
          font_size = 90;
          font_family = fonts.family;
          shadow_passes = 1;
          shadow_size = 3;
          shadow_boost = "0.8";

          position = "0, -80";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "Locked";
          color = colors.fg;
          font_size = 9;
          font_family = fonts.family;

          position = "-135, 40";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "lock";
          color = colors.fg;
          font_size = 10;
          font_family = fonts.icon;

          position = "-165, 39";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$LAYOUT";
          color = colors.fg;
          font_size = 9;
          font_family = fonts.family;

          position = "140, 40";
          halign = "center";
          valign = "bottom";
        }
      ];
      shape = [
        {
          monitor = "";
          size = "80, 35";
          color = colors.bg;
          rounding = 18;
          shadow_passes = 1;
          shadow_size = 2;
          shadow_boost = "1.0";

          position = "-140, 30";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          size = "80, 35";
          color = colors.bg;
          rounding = 18;
          shadow_passes = 1;
          shadow_size = 2;
          shadow_boost = "1.0";

          position = "140, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
