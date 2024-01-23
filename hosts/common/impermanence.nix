{inputs, ...}: {
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  system.activationScripts.createPersist = "mkdir -p /nix/persist";

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    # TODO: Separate into their modules respectively
    directories = [
      "/etc/nixos"
      "/etc/infra"
      "/etc/NetworkManager"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/docker"
    ];
  };
}
