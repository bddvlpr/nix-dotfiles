{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common/global.nix
    ../common/nvidia.nix
    ./hardware.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "dissension";
}
