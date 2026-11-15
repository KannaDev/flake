{ config, pkgs, ... }:

{
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    # Firefox unlocking also requires PolKit to be enabled.
    polkitPolicyOwners = [ "hazel" ];
  };

  # 1password Firefox browser extension support
  programs._1password.package = pkgs._1password-gui;
}
