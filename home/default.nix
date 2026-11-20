{
  home = {
    username = "arx";
    homeDirectory = "/home/arx";
    stateVersion = "26.05";
    sessionVariables.EDITOR = "emacs";
  };

  imports = [
    ./config
    ./pkgs
  ];

  services.syncthing = {
    enable = true;
    tray.enable = true;
  };

  programs.home-manager.enable = true;
}
