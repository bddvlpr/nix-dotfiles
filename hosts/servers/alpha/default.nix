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
