#!/bin/sh
exec sudo -H nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake ".#${1:-HazelsMeowBookPro}"