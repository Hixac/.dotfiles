{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "Hixac";
      user.email = "darkinbladechadshin92321@gmail.com";
    };
  };
}
