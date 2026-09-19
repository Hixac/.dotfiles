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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      user = "hixac";
    in
    {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
        ./.config/home-manager/home.nix

        {
            home = {
                homeDirectory = "/home/${user}";
                username = "${user}";
                stateVersion = "26.05";
            };
        }

        ];
      };
    };
}
