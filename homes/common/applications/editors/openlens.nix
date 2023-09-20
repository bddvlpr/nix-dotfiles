{pkgs, ...}: {
  home = {
    packages = [pkgs.openlens];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/OpenLens"];
  };
}
