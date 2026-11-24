{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      directory = {
        home_symbol = "";
        read_only = " 󰌾 ";
        truncation_length = 2;
        truncation_symbol = ".../";
      };
    };
  };
}
