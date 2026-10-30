{
  home.username = "arx";
  home.homeDirectory = "/home/arx";
  home.stateVersion = "26.05";

  imports = [
    ./config
    ./pkgs
  ];

  services.awww.enable = true;

  programs.home-manager.enable = true;
}
