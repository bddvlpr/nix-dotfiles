{pkgs, ...}: {
  home = {
    packages = with pkgs; [cinny-desktop];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".local/share/cinny"
      ".local/share/in.cinny.app"
      ".cache/cinny"
    ];
  };
}
