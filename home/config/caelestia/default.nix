{ inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./templates.nix
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance = {
        transparency =  {
          enabled = true;
          base = 0.9;
          layers = 0.4;
        };
      };
      general = {
        logo = "caelestia";
      };
      bar = {
        persistent = true;
        scrollActions = {
          workspaces = true;
          volume = true;
          brightness = false;
        };
        workspaces = {
          shown = 5;
          activeIndicator = true;
          occupiedBg = false;
          showWindows = false;
          showUnoccupied = true;
          showWindowsOnSpecialWorkspaces = false;
          displayType = "icons";
        };
        activeWindow = {
          compact = true;
          inverted = true;
          showOnHover = true;
        };
        clock = {
          background = false;
          showDate = true;
          showIcon = true;
        };
        statusIcons = [
          {
            id = "lockStatus";
            enabled = true;
          }
          {
            id = "network";
            enabled = true;
          }
          {
            id = "bluetooth";
            enabled = false;
          }
          {
            id = "battery";
            enabled = false;
          }
          {
            id = "kbLayout";
            enabled = true;
          }
        ];
      };
      launcher.actionPrefix = ".";
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
