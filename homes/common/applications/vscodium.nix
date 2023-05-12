{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs; [
      vscode-extensions.bbenoist.nix
      vscode-extensions.catppuccin.catppuccin-vsc
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
    };
  };
}
