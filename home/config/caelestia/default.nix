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
        transparency = {
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
            enabled = true;
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
        entries = [
          {
            id = "logo";
            enabled = true;
          }
          {
            id = "workspaces";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "activeWindow";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ];
      };
      background = {
        enabled = true;
        wallpaperEnabled = true;
        visualiser = {
          enabled = true;
          autoHide = true;
          blur = false;
          rounding = 1;
          spacing = 1;
        };
      };
      launcher.actionPrefix = ".";
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = true;
      };
    };
  };
}
