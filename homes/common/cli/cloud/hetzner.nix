{pkgs, ...}: {
  home = {
    packages = [pkgs.hcloud];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/hcloud"];
  };
}
