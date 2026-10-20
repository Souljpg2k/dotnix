{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12.0;
    };

    shellIntegration.enableFishIntegration = true;
    shellIntegration.mode = "no-cursor";

    settings = {
      shell = "fish";
      cursor_shape = "block";
      cursor_trail = 1;
      cursor_blink_interval = "0.5";
      confirm_os_window_close = 0;
      copy_on_select = "yes";
      mouse_hide_wait = 1;
      window_padding_width = 21;
      background_opacity = "0.3";
      dynamic_background_opacity = true;

      background = "#1a1b26";
      foreground = "#c0caf5";
      selection_background = "#33467c";
      selection_foreground = "#c0caf5";
      cursor = "#c0caf5";
      cursor_text_color = "#15161e";
      url_color = "#7dcfff";

      color0 = "#15161e";
      color8 = "#414868";
      color1 = "#f7768e";
      color9 = "#f7768e";
      color2 = "#9ece6a";
      color10 = "#9ece6a";
      color3 = "#e0af68";
      color11 = "#e0af68";
      color4 = "#7aa2f7";
      color12 = "#7aa2f7";
      color5 = "#bb9af7";
      color13 = "#bb9af7";
      color6 = "#7dcfff";
      color14 = "#7dcfff";
      color7 = "#a9b1d6";
      color15 = "#c0caf5";
    };
  };
}
