{
  programs.fastfetch = {
    enable = true;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        source = "nixos_small";
        padding = {
          top = 2;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        "title"
        {
          type = "os";
          key = "OS";
        }
        {
          type = "kernel";
          key = "KERNEL";
        }
        {
          type = "uptime";
          key = "UPTIME";
        }
        {
          type = "packages";
          key = "PKGS";
        }
        {
          type = "wm";
          key = "WM";
        }
        {
          type = "shell";
          key = "SHELL";
        }
        {
          type = "terminal";
          key = "TERMINAL";
        }
        {
          type = "cpu";
          key = "CPU";
        }
        {
          type = "gpu";
          key = "GPU";
        }
        {
          type = "memory";
          key = "MEMORY";
        }
      ];
    };
  };
}
