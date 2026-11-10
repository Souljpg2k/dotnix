{ pkgs, config, inputs, ... }:
let
  emacs = "${config.home.homeDirectory}/dotnix/home/config/emacs";
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-nox;

    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.typescript-mode
      epkgs.indent-bars
      epkgs.company
      epkgs.diff-hl
      epkgs.yasnippet
      epkgs.rainbow-mode
      epkgs.lsp-mode
      epkgs.tokyo-night
      epkgs.treesit-grammars.with-all-grammars
      inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.qml-ts-mode
    ];
  };

  services.emacs.enable = true;

  home.file = {
    ".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink "${emacs}/init.el";
    ".emacs.d/lisp".source = config.lib.file.mkOutOfStoreSymlink "${emacs}/lisp";
  };
}
