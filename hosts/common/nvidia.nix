{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
  ];

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
}
