{ ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;
      SearchEngines = {
        Add = [
          {
            Name = "Kagi (managed)";
            URLTemplate = "https://kagi.com/search?q={searchTerms}";
            Method = "GET";
          }
        ];
        Default = "Kagi (managed)";
        DefaultPrivate = "Kagi (managed)";
      };
      Preferences = {
        "browser.newtabpage.activity-stream.feeds.section.topstories" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.feeds.system.topstories" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.showSponsored" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = {
          Value = false;
          Status = "locked";
        };
      };
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
        "search@kagi.com" = {
          install_url = moz "kagi-search-for-firefox";
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
