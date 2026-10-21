{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
      };
      display = {
        separator = " ";
      };
      modules = [
        {
          type = "os";
          key = "OS      ";
        }
        {
          type = "kernel";
          key = "KERNEL  ";
        }
        {
          type = "uptime";
          key = "UPTIME  ";
        }
        {
          type = "wm";
          key = "WM      ";
        }
        {
          type = "shell";
          key = "SHELL   ";
        }
        {
          type = "terminal";
          key = "TERMINAL";
        }
        {
          type = "memory";
          key = "MEMORY  ";
        }
      ];
    };
  };
}