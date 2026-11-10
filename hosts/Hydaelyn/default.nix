{ pkgs, ... }:

{
  networking.hostName = "Hydaelyn";
  networking.networkmanager.enable = true;

  users.users.hazel = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  home-manager.users.hazel = {
    imports = [ ../../home/home.nix ];
    home.homeDirectory = "/home/hazel";
  };

  system.stateVersion = "26.05";
}
