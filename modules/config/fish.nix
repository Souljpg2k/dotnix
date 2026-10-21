{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      hypr = "vim ~/nixos/modules/config/hypr/hyprland.lua";
      lock = "~/nixos/scripts/lock.sh";
    };
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos#nixos-btw";
      ncg = "sudo nix-collect-garbage -d";
      ff = "fastfetch";
    };
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
    shellInit = ''
      set -gx EDITOR vim
      set -gx VISUAL vim
    '';
  };
}