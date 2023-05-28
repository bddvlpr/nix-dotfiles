{ pkgs, ... }:

{
  home.packages = with pkgs; [ blender ];

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/blender" ];
}
