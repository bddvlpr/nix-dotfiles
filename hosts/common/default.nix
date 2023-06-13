{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./boot.nix
    ./impermanence.nix
    ./networking.nix
    ./users.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
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

  programs = {
    dconf.enable = true;
    light.enable = true;
    fuse.userAllowOther = true;
  };

  console.keyMap = "be-latin1";

  services.ntp.enable = true;
  time.timeZone = "Europe/Brussels";

  security.polkit.enable = true;
  system.stateVersion = "22.11";
}
