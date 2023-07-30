{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = ["ahci" "xhci_pci" "virtio_pci" "sd_mod" "sr_mod"];
      kernelModules = ["virtio_gpu"];
    };
    kernelModules = [];
    kernelParams = ["console=tty"];
    extraModulePackages = [];
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
