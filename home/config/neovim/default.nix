{ pkgs, config, ... }:
let
  nvim = "${config.home.homeDirectory}/nixos/home/config/neovim/init.lua";
in
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

  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink nvim;
}
