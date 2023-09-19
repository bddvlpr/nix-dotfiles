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
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking = {
    hostName = "bravo";

    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "enp1s0";
    };
  };
}
