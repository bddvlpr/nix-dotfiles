{
  imports = [
    ../../../homes/bddvlpr
    ../../../homes/common/audio.nix
    ../../../homes/common/applications
    ../../../homes/common/cli
    ../../../homes/common/desktop/hyprland
    ../../../homes/common/services/gnome-keyring.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      x = 0;
    }
  ];
}
