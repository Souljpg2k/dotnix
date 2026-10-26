{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      py = "python";
      e = "emacs";
      em = "emacs";
    };
    
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/dotnix#nixos-btw";
      ncg = "sudo nix-collect-garbage -d";
    };

    shellInit = ''
      set -gx EDITOR emacs
      set -gx VISUAL emacs
    '';

    functions.fish_prompt = ''
      set -l last $status
      set -l c white
      if test $last -ne 0
        set c red
      end
      echo -n (set_color blue)(whoami)@(prompt_hostname)(set_color normal)
      echo -n ' '(set_color green)(prompt_pwd)(set_color normal)
      fish_vcs_prompt (printf ' \uf418 %%s')
      echo -n ' '(set_color $c)'$ '(set_color normal)
    '';
  };
}