{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        live-config = 1;
        framerate = 60;
        autosens = 1;
        bars = 0;
        bar_width = 2;
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
        background = "'default'";
        foreground = "'#97ccf9'";
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
