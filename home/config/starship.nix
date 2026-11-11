{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''$directory$git_branch$character'';
      character = {
        success_symbol = "[ ](bold fg:green)";
        error_symbol = "[ ](bold fg:red)";
      };
      package.disabled = true;
      git_branch = {
        style = "bg:black";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = " [](bold fg:black)[$symbol $branch(:$remote_branch)](fg:white bg:black)[](bold fg:black)";
      };
      directory = {
        read_only = "  ";
        style = "bg:black fg:white";
        truncation_length = 2;
        truncation_symbol = ".../";
        format = "[](bold fg:black)[$path]($style)[](bold fg:black)";
      };
    };
  };
}
