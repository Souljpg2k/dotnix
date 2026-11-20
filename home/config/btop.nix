{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "sky";
      theme_background = false;
    };
    themes.sky = ''
      theme[main_bg]=""
      theme[main_fg]="#e0e3e8"
      theme[title]="#97ccf9"
      theme[hi_fg]="#b8c8d9"
      theme[selected_bg]="#97ccf9"
      theme[selected_fg]="#003450"
      theme[inactive_fg]="#c1c7ce"
      theme[proc_misc]="#d0bfe7"
      theme[cpu_box]="#8b9198"
      theme[mem_box]="#8b9198"
      theme[net_box]="#8b9198"
      theme[proc_box]="#8b9198"
      theme[div_line]="#41474d"
      theme[temp_start]="#b8c8d9"
      theme[temp_mid]="#97ccf9"
      theme[temp_end]="#ffb4ab"
      theme[cpu_start]="#b8c8d9"
      theme[cpu_mid]="#97ccf9"
      theme[cpu_end]="#ffb4ab"
      theme[free_start]="#b8c8d9"
      theme[free_mid]=""
      theme[free_end]="#394856"
      theme[cached_start]="#d0bfe7"
      theme[cached_mid]=""
      theme[cached_end]="#4d4162"
      theme[available_start]="#97ccf9"
      theme[available_mid]=""
      theme[available_end]="#024b71"
      theme[used_start]="#ffb4ab"
      theme[used_mid]=""
      theme[used_end]="#93000a"
      theme[download_start]="#b8c8d9"
      theme[download_mid]="#97ccf9"
      theme[download_end]="#d0bfe7"
      theme[upload_start]="#b8c8d9"
      theme[upload_mid]="#97ccf9"
      theme[upload_end]="#d0bfe7"
    '';
  };
}
