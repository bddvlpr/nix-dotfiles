{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      steam
      gamescope
      protontricks
      mangohud
    ];

    persistence."/nix/persist/home/bddvlpr" = {
      allowOther = true;
      directories = [
        ".local/share/Steam"
      ];
    };
  };
}
