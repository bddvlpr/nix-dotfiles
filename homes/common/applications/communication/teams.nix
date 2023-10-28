{pkgs, ...}: {
  home = {
    # TODO: awaiting PR https://github.com/NixOS/nixpkgs/pull/263531
    #packages = with pkgs; [teams-for-linux];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/teams-for-linux"
    ];
  };
}
