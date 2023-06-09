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
    ../common/modules/aagl.nix
    ../common/modules/audio.nix
    ../common/modules/docker.nix
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

  networking.hostName = "dissension";
}
