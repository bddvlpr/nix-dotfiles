{pkgs, ...}: {
  home = {
    packages = with pkgs; [nheko];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/nheko"];
  };
}
