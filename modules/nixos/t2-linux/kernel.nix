{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = with pkgs; recurseIntoAttrs (linuxPackagesFor (callPackage ./patches/t2-patches.nix {}));
    initrd.kernelModules = ["apple-bce"];
  };

  powerManagement = {
    powerUpCommands = "${pkgs.kmod}/bin/modprobe apple_touchbar";
    powerDownCommands = "${pkgs.kmod}/bin/rmmod apple_touchbar";
  };
}
