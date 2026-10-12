{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "";
      user.email = "";
    };
  };
}
