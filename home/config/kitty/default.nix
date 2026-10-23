{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    shellIntegration.enableFishIntegration = true;
    shellIntegration.mode = "no-cursor";
    
    font = {
      name = "Hack Nerd Font";
      size = 12.0;
    };

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
    };
  };
}
