{ pkgs, ... }:

{
  home.packages = with pkgs; [ discord ];

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/discord" ];
}
