{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "apple.theme";
      theme_background = false;
    };
  };

  xdg.configFile."btop/themes/apple.theme".text = ''
    theme[main_bg]=""
    theme[main_fg]="#f2f2f7"

    theme[title]="#5cb8ff"
    theme[hi_fg]="#64D2FF"

    theme[selected_bg]="#5cb8ff"
    theme[selected_fg]="#f2f2f7"

    theme[inactive_fg]="#aeaeb2"
    theme[proc_misc]="#a7aaff"

    theme[cpu_box]="#636366"
    theme[mem_box]="#636366"
    theme[net_box]="#636366"
    theme[proc_box]="#636366"
    theme[div_line]="#48484a"

    theme[temp_start]="#3bddec"
    theme[temp_mid]="#fedf43"
    theme[temp_end]="#ff8ac4"

    theme[cpu_start]="#3bddec"
    theme[cpu_mid]="#5cb8ff"
    theme[cpu_end]="#a7aaff"

    theme[free_start]="#3bddec"
    theme[free_mid]=""
    theme[free_end]="#48484a"

    theme[cached_start]="#a7aaff"
    theme[cached_mid]=""
    theme[cached_end]="#48484a"

    theme[available_start]="#64D2FF"
    theme[available_mid]=""
    theme[available_end]="#48484a"

    theme[used_start]="#5cb8ff"
    theme[used_mid]=""
    theme[used_end]="#ff8ac4"

    theme[download_start]="#64D2FF"
    theme[download_mid]="#5cb8ff"
    theme[download_end]="#a7aaff"

    theme[upload_start]="#3bddec"
    theme[upload_mid]="#5cb8ff"
    theme[upload_end]="#a7aaff"
  '';
}