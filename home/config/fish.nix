{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    functions.fish_prompt = ''
      set -l last $status
      set -l col white
      if test $last -ne 0
        set col red
      end
      printf (set_color blue)(prompt_pwd)(set_color --reset)
      printf (set_color green)(fish_vcs_prompt (printf '  %%s'))(set_color --reset)
      printf %s (set_color $col)' # '(set_color --reset)
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
