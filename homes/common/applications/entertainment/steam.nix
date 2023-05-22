{ pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    gamescope
    protontricks
  ];

  home.persistence."/nix/persist/home/bddvlpr" = {
    allowOther = true;
    directories = [
      ".local/share/Steam"
    ];
  };
}
