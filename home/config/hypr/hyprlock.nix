let
  colors = {
    bg = "rgb(28, 28, 30)";
    fg = "rgb(229, 229, 234)";
    time = "rgb(242, 242, 247)";
  };
  fonts = {
    family = "Roboto";
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
          placeholder_text = "<i>password</i>";
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
          text = "lock";
          color = colors.fg;
          font_size = 15;
          font_family = fonts.icon;

          position = "-175, 36";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "Locked";
          color = colors.fg;
          font_size = 11;
          font_family = fonts.family;

          position = "-140, 38";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "keyboard";
          color = colors.fg;
          font_size = 16;
          font_family = fonts.icon;

          position = "135, 34";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$LAYOUT[US,TH]";
          color = colors.fg;
          font_size = 11;
          font_family = fonts.family;

          position = "160, 38";
          halign = "center";
          valign = "bottom";
        }
      ];
      shape = [
        {
          monitor = "";
          size = "100, 35";
          color = colors.bg;
          rounding = 18;
          shadow_passes = 1;
          shadow_size = 2;
          shadow_boost = "1.0";

          position = "-150, 30";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          size = "100, 35";
          color = colors.bg;
          rounding = 18;
          shadow_passes = 1;
          shadow_size = 2;
          shadow_boost = "1.0";

          position = "150, 30";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
