{ pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    gamescope
    protontricks
    mangohud
  ];

  home.persistence."/nix/persist/home/bddvlpr" = {
    allowOther = true;
    directories = [
      ".local/share/Steam"
    ];
  };
}
