{ inputs, pkgs, ... }:
let
  openVsxExtensions = inputs.nix-vscode-extensions.extensions.${pkgs.system}.open-vsx;
in
{
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with openVsxExtensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc
      icrawl.discord-vscode
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
    };
  };
}
