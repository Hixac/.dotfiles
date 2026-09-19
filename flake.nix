{
  description = "Nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { self, nixpkgs, zapret-discord-youtube, ... }@inputs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

        zapret-discord-youtube.nixosModules.default
        {
          services.zapret-discord-youtube = {
            enable = false;
            configName = "general(ALT)";
          };
        }
      ];
    };
  };
}
