{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$cmd_duration$directory$git_branch$character";
      character = {
        success_symbol = "[ ](bold blue)";
        error_symbol = "[ ](bold red)";
      };
      directory = {
        home_symbol = "~";
        read_only = " 󰌾 ";
        "truncation_length" = 2;
        "truncation_symbol" = ".../";
        style = "bg:252 fg:black";
        format = " [](bold fg:252)[$path]($style)[](bold fg:252)";
      };
      git_branch = {
        symbol = "  ";
        "truncation_length" = 4;
        "truncation_symbol" = "";
        style = "bg:252 fg:black";
        format = " [](bold fg:252)[$symbol$branch]($style)[](bold fg:252)";
      };
      cmd_duration = {
        min_time = 0;
        style = "bg:252 fg:black";
        format = "[](bold fg:252)[󰔚 $duration]($style)[](bold fg:252)";
      };
    };
  };
}
