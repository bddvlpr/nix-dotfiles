{
  inputs,
  outputs,
  config,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./impermanence.nix
    ./networking.nix
    ./openssh.nix
    ./users.nix
    ../../secrets/system.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
      trusted-users = ["bddvlpr"];
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

  programs.fuse.userAllowOther = true;

  console.keyMap = "be-latin1";

  services.ntp.enable = true;
  time.timeZone = "Europe/Brussels";

  security.polkit.enable = true;
  system.stateVersion = "22.11";
}
