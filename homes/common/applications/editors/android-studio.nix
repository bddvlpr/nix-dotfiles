{pkgs, ...}: {
  home = {
    packages = [pkgs.android-studio];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/Google"
      ".cache/Google"
      ".gradle"
      ".android"
    ];
  };
}
