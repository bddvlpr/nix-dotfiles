{ pkgs, lib, ... }:

{
  programs.discocss = {
    enable = true;

    css = builtins.readFile (builtins.fetchurl {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
      sha256 = "0z3sqirr4hccf743q2by0f6gii7d5lzq4zhc438s8jzkrn8sf3g7";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/discord" ];
}
