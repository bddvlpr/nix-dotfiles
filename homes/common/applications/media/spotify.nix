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

  home = {
    packages = [pkgs.spotify-player];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/spotify"
      ".cache/spotify"
    ];
  };
}
