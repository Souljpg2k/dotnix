{
  programs.bash = {
    enable = true;

    shellAliases = {
      e = "emacs";
      em = "emacs";
      nrs = "sudo nixos-rebuild switch --flake ~/dotnix#nixos-btw";
    };

    promptInit = ''
      export PS1='\[\e[32m\]\u\[\e[32m\]@\[\e[32m\]\h\[\e[0m\] \[\e[34m\]\w\[\e[37m\] \$ '
    '';
  };
}
