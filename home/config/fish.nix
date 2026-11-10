{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      set -l last $status
      set -l col white
      if test $last -ne 0
        set col red
      end
      echo -n (set_color cyan)(whoami)@(prompt_hostname)(set_color normal)
      echo -n ' '(set_color purple)(prompt_pwd)(set_color normal)
      fish_vcs_prompt (printf '  %%s')
      echo -n ' '(set_color $col)'$ '(set_color normal)
    '';

    shellAliases = {
      py = "python";
      e = "emacs";
      em = "emacs";
      nrs = "sudo nixos-rebuild switch --flake ~/dotnix#nixos-btw";
      ncg = "sudo nix-collect-garbage -d";
    };
  };
}
