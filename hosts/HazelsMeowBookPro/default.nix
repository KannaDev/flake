{ ... }:

{
  imports = [ ./dock.nix ];

  users.users.hazel.home = "/Users/hazel";
  system.primaryUser = "hazel";
  system.stateVersion = 6;

  programs.fish.enable = true;

  home-manager.users.hazel = {
    imports = [
      ../../home/home.nix
      ./home.nix
    ];
  };
}
