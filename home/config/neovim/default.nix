{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      indent-blankline-nvim
      nvim-autopairs
      gitsigns-nvim
      tokyonight-nvim

      (nvim-treesitter.withPlugins (p: [
        p.lua
        p.nix
      ]))
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
}
