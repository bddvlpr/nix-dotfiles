{
  imports = [
    ../../homes/bddvlpr
    ../../homes/common/audio.nix
    ../../homes/common/applications
    ../../homes/common/cli
    ../../homes/common/desktop/hyprland
    ../../homes/common/services/gnome-keyring.nix
    ../../homes/common/services/spotifyd.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
    }
  ];
}
