{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      userName = "Hixac";
      userEmail = "darkinbladechadshin92321@gmail.com";
    };
  };
}
