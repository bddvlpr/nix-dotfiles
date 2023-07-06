{pkgs, ...}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];

  environment = {
    systemPackages = with pkgs; [nvtop-amd];
    sessionVariables.NIXOS_OZONE_WL = "1"; # https://github.com/NixOS/nixpkgs/issues/224332#issuecomment-1528748548
  };
}
