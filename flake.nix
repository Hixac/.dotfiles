{
  description = "i'm flaked";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system  = "x86_64-linux";
      pkgs    = nixpkgs.legacyPackages.${system};
      lib     = nixpkgs.lib;
      user    = "hixac";
      modDir  = ./.config/home-manager/modules;
    in
    {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./.config/home-manager/home.nix

          {
            home = {
              homeDirectory = "/home/${user}";
              username      = user;
              stateVersion  = "26.05";
            };
          }

          {
            imports = lib.fileset.toList (
              lib.fileset.fileFilter
                (file: file.hasExt "nix")
                modDir
            );
          }
        ];
      };
    };
}
