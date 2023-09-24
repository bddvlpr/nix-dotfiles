{pkgs, ...}: {
  home = {
    packages = [pkgs.nextcloud-client];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/Nextcloud"
      "Nextcloud"
    ];
  };
}
