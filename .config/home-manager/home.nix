{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # required to autoload fonts from packages installed via Home Manager
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.dsh
    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pdfvision

    jujutsu
    postgresql
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
    jdk
    qbittorrent
    mpv
    gimp
    act
    libreoffice
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

      setw -g mode-keys vi

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
      export DOTFILES=$HOME/.dotfiles/

      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.obs-studio.enable = true;

  services.tg-ws-proxy = {
    enable = true;
    host = "127.0.0.1";
    port = 1080;
    # TLS-хендшейк к доменам CF-прокси режется DPI по SNI (см. диагностику):
    # ws:// на порту 80 идёт без SNI и проходит. Цена — нет TLS до Cloudflare.
    extraArgs = [ "--cf-disable-tls" ];
  };

  services.flameshot = {
    enable = true;
    settings = {
      General.useX11LegacyScreenshot = true; # necessary to avoid "portal" issues on AwesomeWM
    };
  };

  programs.raddebugger.enable = true;

  programs.home-manager.enable = true;
}
