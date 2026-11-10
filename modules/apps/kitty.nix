{ pkgs, ... }:

{
  catppuccin.kitty.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.fish}/bin/fish";
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      macos_show_window_title_in = "none";
      macos_titlebar_color = "background";
      macos_menubar_title_max_length = 0;
      font_size = 16;
    };
  };
}
