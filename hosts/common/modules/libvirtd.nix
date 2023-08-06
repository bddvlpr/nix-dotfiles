{
  virtualisation.libvirtd.enable = true;

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/libvirt"
    ];
  };
}
