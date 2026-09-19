{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    firefox
    neovim
  ];

  home.file = {
    ".config/awesome/".source = ../awesome;
    ".config/nvim/".source = ../nvim;
    ".xinitrc".source = ../../.xinitrc;
  };

  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
    };
    extraConfig = builtins.readFile ../kitty/kitty.conf;
  };

  home.sessionVariables = {
      EDITOR = "nvim";
  };

  services.flameshot = {
    enable = true;
    settings = {
      General.useX11LegacyScreenshot = true; # necessary to avoid "portal" issues on AwesomeWM
    };
  };

  programs.home-manager.enable = true;
}
