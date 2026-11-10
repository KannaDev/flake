{
  description = "hazel's macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nix-darwin, home-manager, catppuccin, ... }:
    let
      hosts = {
        HazelsMeowBookPro = ./hosts/HazelsMeowBookPro;
        HazelsMacBookPro = ./hosts/HazelsMacBookPro;
      };

      mkHost = hostModule:
        nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./modules/lix.nix
            home-manager.darwinModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;

              programs.fish.enable = true;

              users.users.hazel.home = "/Users/hazel";
              system.stateVersion = 6;

              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ catppuccin.homeModules.catppuccin ];
                users.hazel = import hostModule;
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = builtins.mapAttrs (_: mkHost) hosts;
    };
}
