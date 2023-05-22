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
      # Theme & flair
      catppuccin.catppuccin-vsc

      # Nix(OS)
      bbenoist.nix
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
    };
  };
}
