{ config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")

      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-pc-laptop-ssd

      inputs.hardware.nixosModules.common-gpu-nvidia
    ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ "dm-snapshot" ];
      luks.devices.crypted = {
        device = "/dev/disk/by-uuid/01cac429-f025-4049-96bc-8c191bc99fe3";
        preLVM = true;
      };
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" =
      {
        device = "none";
        fsType = "tmpfs";
      };

    "/boot" =
      {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };

    "/nix" =
      {
        device = "/dev/disk/by-label/nix";
        fsType = "ext4";
        neededForBoot = true;
      };
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  networking.useDHCP = lib.mkDefault true;

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:109:0:0";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
