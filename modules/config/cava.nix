{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        live-config = 1;
        framerate = 60;
        autosens = 1;
        bars = 0;
        bar_width = 3;
        bar_spacing = 1;
      };
      input = {
        method = "pipewire";
        source = "auto";
      };
      output = {
        method = "noncurses";
        raw_target = "/dev/stdout";
        data_format = "binary";
        bit_format = "16bit";
      };
      color = {
        horizontal_gradient = 1;
        horizontal_gradient_color_1 = "'#6bcaff'";
        horizontal_gradient_color_2 = "'#a4a2ff'";
      };
      smoothing = {
        monstercat = 1;
        noise_reduction = 80;
      };
      eq = {
        "1" = 1;
        "2" = 1;
        "3" = 1;
        "4" = 1;
        "5" = 1;
      };
    };
  };
}