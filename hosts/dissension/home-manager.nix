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
      # Left monitor
      name = "DP-6";
      width = 1920;
      height = 1080;
      x = 0;
      refreshRate = 165;
      workspace = "1";
    }
    {
      # Center monitor
      name = "HDMI-A-2";
      width = 3440;
      height = 1440;
      x = 1920;
      refreshRate = 100;
      workspace = "2";
    }
    {
      # Right monitor
      name = "DP-4";
      width = 1920;
      height = 1080;
      x = 5360;
      refreshRate = 75;
      workspace = "3";
    }
  ];
}
