{pkgs, ...}: {
  home = {
    packages = [pkgs.steamguard-cli];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/steamguard-cli"
    ];
  };
}
