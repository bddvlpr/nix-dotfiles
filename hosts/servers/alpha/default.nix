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
    ./modules/postgres.nix
    ./modules/synapse.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "alpha";
}
