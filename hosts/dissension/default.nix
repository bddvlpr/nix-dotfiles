{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager

    ../common/global.nix
    ../common/nvidia.nix
    ./hardware.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  environment.persistence."/nix/persist" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager"
      "/var/log"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users = {
      bddvlpr = import ../../homes/bddvlpr;
    };
  };

  networking.hostName = "dissension";

  boot.loader.systemd-boot.enable = true;

  users.users = {
    bddvlpr = {
      hashedPassword = "$6$mFpRxh6DmDvudsLm$pSAcC8pTJrZW00teVGYCPfj7PPovZpgpxS3GWfSmDMUzfEhYe1cP2zl5S.kC.G6Sw0SepFG6r9Ivzvl8UEWoR/";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
