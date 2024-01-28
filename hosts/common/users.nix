{pkgs, ...}: let
  identity = import ../../identities/bddvlpr.nix;
in {
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      root.openssh.authorizedKeys.keys = identity.userKeys;
      bddvlpr = {
        hashedPasswordFile = "/nix/persist/passwd";
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "docker" "libvirtd" "video" "adbusers" "dialout"];
        openssh.authorizedKeys.keys = identity.userKeys;
      };
    };
  };

  programs.fish.enable = true;

  security.sudo.wheelNeedsPassword = false;
}
