{ outputs, inputs, config, pkgs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users = {
    bddvlpr = {
      passwordFile = "/nix/persist/passwd";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.fish;
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
    users.bddvlpr = import ../../homes/bddvlpr;
  };
}
