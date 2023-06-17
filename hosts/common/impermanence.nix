{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/docker"
    ];
  };
}
