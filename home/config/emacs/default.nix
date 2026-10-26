{ pkgs, config, ... }:
let
  emacs = "${config.home.homeDirectory}/dotnix/home/config/emacs";
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;

    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.lua-mode
      epkgs.qml-mode
      epkgs.typescript-mode
      epkgs.catppuccin-theme
      epkgs.indent-bars
      epkgs.company
      epkgs.diff-hl
      epkgs.treesit-grammars.with-all-grammars
      epkgs.yasnippet
      epkgs.rainbow-mode
    ];
  };

  services.emacs.enable = true;

  home.file = {
    ".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink "${emacs}/init.el";
    ".emacs.d/lisp".source = config.lib.file.mkOutOfStoreSymlink "${emacs}/lisp";
  };
}
