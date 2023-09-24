{pkgs, ...}: {
  home = {
    packages = [pkgs.qbittorrent];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/qBittorrent"
      ".local/share/qBittorrent"
    ];
  };
}
