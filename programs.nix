{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    docker-compose
    zip
    unzip
    git
    wget
    fzf
    xclip
    vim
  ];
}
