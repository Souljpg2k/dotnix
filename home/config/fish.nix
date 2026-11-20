{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      e = "emacs";
      em = "emacs";
      mpp = "mpvpaper -f -o 'no-audio --loop-playlist shuffle hwdec=vaapi' DVI-D-1";
      nrs = "sudo nixos-rebuild switch --flake ~/dotnix#nixos-btw";
      ncg = "sudo nix-collect-garbage -d";
    };
  };
}
