{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common/global.nix
    ../common/nvidia.nix
    ./hardware.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users.bddvlpr = import ./home-manager.nix;
  };

  networking.hostName = "solaris";
}
