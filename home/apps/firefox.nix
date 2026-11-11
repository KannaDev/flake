{ ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
    DisablePocket                 = true;
    DisableTelemetry              = true;
    DisableFormHistory            = true;
    DisablePasswordReveal         = true;
    };
    policies.ExtensionSettings =
      let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in
      {
        "*" = {
          installation_mode = "blocked";
        };
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = false;
        };
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = moz "1password-x-password-manager";
          installation_mode = "force_installed";
          updates_disabled = false;
        };
      };
  };
}
