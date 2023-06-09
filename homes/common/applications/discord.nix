{ pkgs, lib, ... }:

{
  programs.discocss = {
    enable = true;

    css = builtins.readFile (builtins.fetchurl {
      url = "https://web.archive.org/web/20230609102405id_/https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
      sha256 = "6cbb7de09899074924f54f9ce567c545f150af19bce4dcdf2f19a4fdbe85d7f2";
    });
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/discord" ];
}
