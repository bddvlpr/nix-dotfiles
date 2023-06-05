{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../common/modules/nvidia.nix
    ../common/modules/xdg.nix
    ./hardware.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "dissension";
}
