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

  environment = {
    systemPackages = with pkgs; [ nvtop ];
    sessionVariables.NIXOS_OZONE_WL = "1"; # https://github.com/NixOS/nixpkgs/issues/224332#issuecomment-1528748548
  };
}
