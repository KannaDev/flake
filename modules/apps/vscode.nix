{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      yzhang.markdown-all-in-one
      jnoortheen.nix-ide
      leonardssh.vscord
      ms-azuretools.vscode-containers
      github.vscode-github-actions
      golang.go
      esbenp.prettier-vscode
      stkb.rewrap
      editorconfig.editorconfig
      dbaeumer.vscode-eslint
      ms-vscode.makefile-tools
    ];
  };
}
