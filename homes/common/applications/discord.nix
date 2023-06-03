{ pkgs, lib, ... }:

{
  programs.discocss = {
    enable = true;

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20230603121533id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
      sha256 = "1c8vfaf7f0sbhxcbhfx5qkdk17bnn2wic012rlv0lv0j1am2gp68";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/discord" ];
}
