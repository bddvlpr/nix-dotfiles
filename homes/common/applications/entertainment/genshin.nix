{
  inputs,
  pkgs,
  ...
}: let
  aagl = inputs.aagl.packages.${pkgs.system};
in {
  home = {
    packages = with aagl; [
      anime-game-launcher
      anime-borb-launcher
      honkers-railway-launcher
      honkers-launcher
    ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".local/share/anime-game-launcher"
    ];
  };
}
