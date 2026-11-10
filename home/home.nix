{ ... }:

{
  imports = [
    ./apps
    ./nix.nix
  ];

  home.username = "hazel";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
