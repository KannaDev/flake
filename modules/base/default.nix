{ catppuccin, ... }:

{
  imports = [ ./nix ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ catppuccin.homeModules.catppuccin ];
  };
}
