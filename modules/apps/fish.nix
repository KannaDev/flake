{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if test "$TERM" = "xterm-kitty"
          alias ssh "kitty +kitten ssh"
      end
    '';
  };
}
