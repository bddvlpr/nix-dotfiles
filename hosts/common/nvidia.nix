{ inputs, config, pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia.modesetting.enable = true;
  };

  services.xserver.videoDrivers = [ "amd" "nvidia" ];

  environment.systemPackages = with pkgs; [ nvtop ];
}
