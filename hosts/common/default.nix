{
  inputs,
  outputs,
  config,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./greetd.nix
    ./gpg.nix
    ./impermanence.nix
    ./networking.nix
    ./openssh.nix
    ./users.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = false;
      warn-dirty = false;
      trusted-users = ["bddvlpr"];
      substituters = [
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
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

  documentation.man.generateCaches = false;
  programs.fuse.userAllowOther = true;
  programs.dconf.enable = true;

  services.ntp.enable = true;
  time.timeZone = "Europe/Brussels";

  security = {
    polkit.enable = true;
    pam = {
      services.swaylock = {};
      loginLimits = [
        {
          domain = "*";
          type = "soft";
          item = "nofile";
          value = "524288";
        }
      ];
    };
  };

  system.stateVersion = "22.11";
}
