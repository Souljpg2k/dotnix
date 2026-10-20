{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "~/nixos/scripts/lock.sh";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = ''hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })' '';
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "~/nixos/scripts/lock.sh";
        }

        {
          timeout = 330;
          on-timeout = ''hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })' '';
          on-resume = ''hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })' '';
        }

        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
