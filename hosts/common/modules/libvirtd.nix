{
  virtualisation.libvirtd.enable = true;

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/libvirt"
    ];
  };
}
