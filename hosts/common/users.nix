{ outputs, inputs, config, pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      bddvlpr = {
        passwordFile = "/nix/persist/passwd";
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
      };
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
