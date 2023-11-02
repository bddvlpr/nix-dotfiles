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
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "macchiato";

    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      lyrics-plus
      marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      hidePodcasts
      lastfm
      powerBar
    ];
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [
    ".config/spotify"
    ".cache/spotify"
  ];
}
