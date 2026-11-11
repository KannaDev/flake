{ catppuccin, pkgs, ... }:

{
  imports = [ ./nix ];

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  users.users.hazel.shell = pkgs.fish;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ catppuccin.homeModules.catppuccin ];
  };
}
