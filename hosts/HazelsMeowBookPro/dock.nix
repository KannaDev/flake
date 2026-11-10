{ config, ... }:

{
system.defaults.dock = {
  #autohide = true;
  #autohide-delay = 0.0;
  #orientation = "left";
  tilesize = 48;
  magnification = true;
  largesize = 80;
  mineffect = "scale";
  minimize-to-application = true;
  show-recents = false;
  mru-spaces = false;};
}