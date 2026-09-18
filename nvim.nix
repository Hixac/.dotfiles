{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    configure = {
      customLuaRC = ''
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.clipboard:append("unnamedplus")
      '';
    };
  };
}
