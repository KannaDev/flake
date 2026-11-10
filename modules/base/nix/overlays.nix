{ ... }:
{
  nixpkgs.overlays = [
    (
      final: prev:
      let
        lixPackages = prev.lixPackageSets.latest;
      in
      {
        nixpkgs-review = prev.nixpkgs-review.override { nix = lixPackages.lix; };
        nix-eval-jobs = lixPackages.nix-eval-jobs;
        nix-fast-build = prev.nix-fast-build.override { nix-eval-jobs = lixPackages.nix-eval-jobs; };
        colmena = prev.colmena.override { nix-eval-jobs = lixPackages.nix-eval-jobs; };
      }
    )
  ];
}
