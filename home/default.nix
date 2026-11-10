{
  home.username = "arx";
  home.homeDirectory = "/home/arx";
  home.stateVersion = "26.05";
  home.sessionVariables.EDITOR = "emacs";

  imports = [
    ./config
    ./pkgs
  ];

  programs.home-manager.enable = true;
}
