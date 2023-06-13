{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ../common/modules/bluetooth.nix
    ../common/modules/nvidia.nix
    ../common/modules/xdg.nix
    ./hardware.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
      nixosConfig = config;
    };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "solaris";
}
