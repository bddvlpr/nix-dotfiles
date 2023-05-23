{ pkgs, lib, ... }:

{
  programs.discocss = {
    enable = true;

    css = builtins.readFile (builtins.fetchurl {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
      sha256 = "1dhisdhb1i4ngbrm549nvfabv5ff19k76n5x0amffxf9qxgfw9a0";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/discord" ];
}
