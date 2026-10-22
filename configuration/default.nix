{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "th_TH.UTF-8";
    LC_IDENTIFICATION = "th_TH.UTF-8";
    LC_MEASUREMENT = "th_TH.UTF-8";
    LC_MONETARY = "th_TH.UTF-8";
    LC_NAME = "th_TH.UTF-8";
    LC_NUMERIC = "th_TH.UTF-8";
    LC_PAPER = "th_TH.UTF-8";
    LC_TELEPHONE = "th_TH.UTF-8";
    LC_TIME = "th_TH.UTF-8";
  };

  users.users.arx = {
    isNormalUser = true;
    description = "arx";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  services.xserver.xkb = {
    layout = "us,th";
    variant = "";
    options = "grp:win_space_toggle";
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    usbutils
    pciutils
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";
}