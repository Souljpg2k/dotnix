{
  home = {
    username = "arx";
    homeDirectory = "/home/arx";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
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
