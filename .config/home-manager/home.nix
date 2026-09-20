{ config, lib, pkgs, ... }:

{
  # required to autoload fonts from packages installed via Home Manager
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    kitty
    firefox
    neovim
    devenv
    nerd-fonts.comic-shanns-mono
  ];

  home.file = {
    ".config/awesome/".source = ../awesome;
    ".config/nvim/".source = ../nvim;
    ".xinitrc".source = ../../.xinitrc;
  };

  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-cursor";
    settings = {
      shell = "${config.programs.zsh.package}/bin/zsh";
    };
    extraConfig = builtins.readFile ../kitty/kitty.conf;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
      theme = "duellj";
    };

    initContent = lib.mkOrder 1000 ''
      export EDITOR=nvim
      export VISUAL=nvim
    '';
  };

  services.flameshot = {
    enable = true;
    settings = {
      General.useX11LegacyScreenshot = true; # necessary to avoid "portal" issues on AwesomeWM
    };
  };

  programs.home-manager.enable = true;
}
