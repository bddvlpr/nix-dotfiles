{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common/global.nix
    ./hardware.nix
  ];

  networking.hostName = "solaris";
}
