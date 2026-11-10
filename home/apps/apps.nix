{ pkgs, ... }:

{
  home.packages = [
    pkgs.discord
    pkgs.spotify
    pkgs.nixfmt
    pkgs.signal-desktop
  ];
}
