{
  imports = [
    ../../homes/bddvlpr
    ../../homes/common/applications
    ../../homes/common/cli
    ../../homes/common/desktop/hyprland
  ];

  monitors = [
    {
      # Left monitor
      name = "HDMI-A-2";
      width = 1920;
      height = 1080;
      x = 0;
      refreshRate = 75;
      workspace = "1";
    }
    {
      # Center monitor
      name = "DP-6";
      width = 1920;
      height = 1080;
      x = 1920;
      refreshRate = 165;
      workspace = "2";
    }
    {
      # Right monitor
      name = "DP-4";
      width = 1920;
      height = 1080;
      x = 3840;
      refreshRate = 75;
      workspace = "3";
    }
  ];
}
