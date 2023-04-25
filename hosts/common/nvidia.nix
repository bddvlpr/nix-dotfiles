{ inputs, pkgs, ... }: {
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [ cudatoolkit nvtop ];
}
