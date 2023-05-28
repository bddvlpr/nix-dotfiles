{ inputs, pkgs, ... }:
let
  nix-index-database = inputs.nix-index-database.hmModules.nix-index;
in
{
  imports = [
    nix-index-database
  ];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
