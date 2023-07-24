{pkgs, ...}: {
  home = {
    packages = [pkgs.discord];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/discord"];
  };
}
