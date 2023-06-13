{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.nix-spicetify.packages.${pkgs.system}.default;
in {
  imports = [inputs.nix-spicetify.homeManagerModule];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin-macchiato;
    colorScheme = "lavender";
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [
    ".config/spotify"
    ".cache/spotify"
  ];
}
