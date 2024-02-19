{pkgs, ...}: {
  home = {
    packages = [
      pkgs.beekeeper-studio
    ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/beekeeper-studio"
    ];
  };
}
