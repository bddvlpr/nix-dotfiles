{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./docker.nix
    ./boot.nix
    ./impermanence.nix
    ./networking.nix
    ./users.nix
  ];

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    overlays = with outputs.overlays; [
      additions
      modifications
      unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  programs.dconf.enable = true;

  console.keyMap = "be-latin1";

  programs.fuse.userAllowOther = true;

  services.ntp.enable = true;

  security.polkit.enable = true;
  system.stateVersion = "22.11";
}
  
