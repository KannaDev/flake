{
  description = "hazel's Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      nix-darwin,
      nixpkgs,
      home-manager,
      catppuccin,
      ...
    }:
    let
      darwinHosts = {
        HazelsMeowBookPro = ./hosts/HazelsMeowBookPro/default.nix;
        HazelsMacBookPro = ./hosts/HazelsMacBookPro;
      };

      mkDarwinHost =
        hostModule:
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit catppuccin; };
          modules = [
            home-manager.darwinModules.home-manager
            ./modules/base
            hostModule
          ];
        };

      mkNixosHost =
        hostModule:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit catppuccin; };
          modules = [
            home-manager.nixosModules.home-manager
            ./modules/base
            hostModule
          ];
        };
    in
    {
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt;
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
      darwinConfigurations = builtins.mapAttrs (_: mkDarwinHost) darwinHosts;
      nixosConfigurations.Hydaelyn = mkNixosHost ./hosts/Hydaelyn/default.nix;
    };
}
