{ config, ... }:

{
  system.defaults.CustomUserPreferences."com.apple.dock"."show-recent-count" = 5;
  system.defaults.dock = {
    #autohide = true;
    #autohide-delay = 0.0;
    #orientation = "left";
    tilesize = 48;
    magnification = true;
    largesize = 80;
    mineffect = "scale";
    minimize-to-application = true;
    show-recents = true;
    mru-spaces = false;
    persistent-apps = [
      { app = "${config.system.primaryUserHome}/Applications/Home Manager Apps/Firefox.app"; }
      { app = "${config.system.primaryUserHome}/Applications/Home Manager Apps/kitty.app"; }
      { app = "${config.system.primaryUserHome}/Applications/Home Manager Apps/Discord.app"; }
      { app = "/Applications/1Password.app"; }
      { app = "${config.system.primaryUserHome}/Applications/Home Manager Apps/Spotify.app"; }
      { app = "${config.system.primaryUserHome}/Applications/Home Manager Apps/Visual Studio Code.app"; }

    ];
  };
}
