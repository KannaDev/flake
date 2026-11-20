{ catppuccin, pkgs, ... }:

{
  imports = [ ./nix ];

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  users.users.hazel.shell = pkgs.fish;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      catppuccin.homeModules.catppuccin
      (
        { config, ... }:
        {
          home.sessionVariables.SOPS_AGE_KEY_FILE = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
        }
      )
    ];
  };
}
