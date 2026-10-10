{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # required to autoload fonts from packages installed via Home Manager
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    tree-sitter
    luarocks
    kitty
    firefox
    neovim
    devenv
    nerd-fonts.comic-shanns-mono
    nixd
    gh
    telegram-desktop
    xdg-utils
    doppler
    android-studio
    act
    jdk
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

      set-option -g default-terminal "screen-256color"
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" "direnv" ];
      theme = "duellj";
    };

    initContent = lib.mkOrder 1000 ''
      export EDITOR=nvim
      export VISUAL=nvim
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  services.flameshot = {
    enable = true;
    settings = {
      General.useX11LegacyScreenshot = true; # necessary to avoid "portal" issues on AwesomeWM
    };
  };

  programs.home-manager.enable = true;
}
