{
  config,
  inputs,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
  ];

  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["dm-snapshot" "nvidia"];
      luks.devices.crypt = {
        device = "/dev/disk/by-uuid/4633f762-11c7-4793-95b4-204d67327068";
        preLVM = true;
      };
    };
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
    };

    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-label/nix";
      fsType = "ext4";
      neededForBoot = true;
    };

    "/mnt/drive0" = {
      device = "/dev/disk/by-label/drive0";
      fsType = "ext4";
    };
  };

  swapDevices = [{device = "/dev/disk/by-label/swap";}];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
