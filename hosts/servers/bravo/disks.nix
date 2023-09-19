{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.disko
  ];
  disko.devices = {
    nodev."/" = {
      fsType = "tmpfs";
      mountOptions = ["mode=755"];
    };
    disk.sda = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "table";
        format = "gpt";
        partitions = [
          {
            name = "boot";
            start = "0";
            end = "512MiB";
            bootable = true;
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          }
          {
            name = "nix";
            start = "512MiB";
            end = "100%";
            part-type = "primary";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/nix";
            };
          }
        ];
      };
    };
  };
}
