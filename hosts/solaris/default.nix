{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common/global.nix
    ../common/nvidia.nix
    ./hardware.nix
  ];

  networking.hostName = "solaris";
}
