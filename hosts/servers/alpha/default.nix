{
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    ../../common

    ./disks.nix
    ./hardware.nix

    ./modules/logging.nix
    ./modules/nginx.nix
    ../../../containers/synapse.nix
    ../../../containers/untis-ics-sync.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking = {
    hostName = "alpha";

    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "enp1s0";
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [22];
    };
  };
}
