{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [ wlrobs ];
  };

  home.persistence."/nix/persist/home/bddvlpr".directories = [ ".config/obs-studio" ];
}
