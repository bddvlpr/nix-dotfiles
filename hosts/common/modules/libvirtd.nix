{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
    };
  };

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/libvirt"
    ];
  };
}
