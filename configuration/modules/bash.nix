{
  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      e = "emacs";
      em = "emacs";
      mpp = "mpvpaper -f -o 'no-audio --loop-playlist shuffle hwdec=vaapi' DVI-D-1";
      nrs = "sudo nixos-rebuild switch --flake ~/dotnix#nixos-btw";
      ncg = "sudo nix-collect-garbage -d";
    };
    promptInit = ''
      export PS1='\[\e[32m\]\u\[\e[32m\]@\[\e[32m\]\h\[\e[0m\] \[\e[34m\]\w\[\e[97m\] \$ '
    '';
  };
}
