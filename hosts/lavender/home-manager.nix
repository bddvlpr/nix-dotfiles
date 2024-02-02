{
  imports = [
    ../../homes/bddvlpr
    ../../homes/common/audio.nix
    ../../homes/common/applications
    ../../homes/common/cli
    ../../homes/common/desktop/hyprland
    ../../homes/common/services/gnome-keyring.nix
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 3072;
      height = 1920;
      x = 0;
      scale = 1.5;
    }
  ];
}
