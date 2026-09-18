{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./git.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Krasnoyarsk";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver = { # xorg
    xkb.layout = "us,ru";
    displayManager.startx.enable = true;
    windowManager.awesome.enable = true;
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;

  users.defaultUserShell = pkgs.zsh;
  users.users.hixac = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  }; # if you gonna create new user don't forget to use passwd

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
      theme = "robbyrussell";
    };
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    fzf
    xclip
    vim
  ];

  environment.sessionVariables = {
    CONFIGURATION_NIX = "/etc/nixos/configuration.nix";
    DIR_NIX = "/etc/nixos/";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05"; # Dont change it
}

