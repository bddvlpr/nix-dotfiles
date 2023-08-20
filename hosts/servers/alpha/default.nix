{
  inputs,
  outputs,
  config,
  ...
}: {
  imports = [
    ../../common
    ../common/firewall.nix
    ../common/logging.nix

    ./disks.nix
    ./hardware.nix

    ./modules/nginx.nix
    ../../../containers/owncast.nix
    ../../../containers/synapse.nix
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
  };
}
