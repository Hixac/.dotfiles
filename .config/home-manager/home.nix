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
    nixd
    gh
    telegram-desktop
    xdg-utils
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

  programs.tmux = {
    enable = true;

    prefix = "C-a";
    shortcut = "a";

    # tmux-sensible is handled by Home Manager’s sensibleOnTop option.
    sensibleOnTop = true;

    # Home Manager installs/loads these directly; TPM is not needed.
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      continuum
    ];

    extraConfig = ''
      unbind C-b
      set -g renumber-windows on

      bind c  new-window      -c "#{pane_current_path}"
      bind %  split-window -h -c "#{pane_current_path}"
      bind '"' split-window -v -c "#{pane_current_path}"
    '';
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
