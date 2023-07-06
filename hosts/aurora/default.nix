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
    ../common/modules/amd.nix
    ../common/modules/audio.nix
    ../common/modules/bluetooth.nix
    ../common/modules/docker.nix
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

  networking.hostName = "aurora";
}
