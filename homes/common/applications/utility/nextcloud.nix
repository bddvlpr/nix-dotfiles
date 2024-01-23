{pkgs, ...}: {
  home = {
    packages = [pkgs.nextcloud-client];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/Nextcloud"
      "Nextcloud"
    ];
  };

  wayland.windowManager.hyprland.settings.exec = [
    "${pkgs.nextcloud-client}/bin/nextcloud"
  ];
}
