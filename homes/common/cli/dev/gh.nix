{pkgs, ...}: {
  home = {
    packages = [pkgs.gh];
    persistence."/nix/persist/home/bddvlpr".directories = [".config/gh"];
  };
}
