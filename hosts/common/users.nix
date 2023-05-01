{ outputs, inputs, config, pkgs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users = {
    defaultUserShell = pkgs.fish;
    users = {
      bddvlpr = {
        passwordFile = "/nix/persist/passwd";
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users.bddvlpr = import ../../homes/bddvlpr;
  };

  security.sudo.wheelNeedsPassword = false;
}
