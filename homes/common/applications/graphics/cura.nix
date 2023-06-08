{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ cura ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/cura"
      ".local/share/cura"
    ];
  };
}
