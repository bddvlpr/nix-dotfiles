{pkgs, ...}: {
  home = {
    packages = with pkgs; [teams-for-linux];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/teams-for-linux"
    ];
  };
}
