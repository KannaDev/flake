{ pkgs, ... }:

{
  imports = [
    ./dock.nix
    ./finder.nix
  ];

  users.users.hazel.home = "/Users/hazel";
  system.primaryUser = "hazel";
  system.stateVersion = 6;
  nix-homebrew = {
    enable = true;
    user = "hazel";
  };

  homebrew = {
    enable = true;
    user = "hazel";
    onActivation.extraEnv.HOMEBREW_GIT_PATH = "${pkgs.git}/bin/git";
  };

  environment.variables.HOMEBREW_GIT_PATH = "${pkgs.git}/bin/git";

  programs.fish.enable = true;

  home-manager.users.hazel = {
    imports = [
      ../../home/home.nix
      ./home.nix
      ./apps.nix

    ];
  };
}
