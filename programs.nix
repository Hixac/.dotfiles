{ pkgs, ... }:

{
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    zip
    unzip
    git
    wget
    fzf
    xclip
    vim
    flameshot
  ];
}
