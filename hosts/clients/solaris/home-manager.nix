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
      x = 2560;
    }
    {
      name = "HDMI-A-1";
      width = 2560;
      height = 1440;
      refreshRate = 60;
      x = 0;
    }
  ];
}
