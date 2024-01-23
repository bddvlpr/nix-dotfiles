{pkgs, ...}: {
  home = {
    packages = [pkgs.vesktop];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/discord"
      ".config/vesktop"
    ];
  };
}
