{
  pkgs,
  lib,
  ...
} @ args: let
  patchesRepo = pkgs.fetchFromGitHub {
    owner = "t2linux";
    repo = "linux-t2-patches";
    rev = "cab84310e3f7bae984cb3a7e82d099922d6b4f57";
    hash = "sha256-8BO8WhBzmx+o7EtgzPx2vKFolgV09RxCij1Om/P7/1M=";
  };
  kernelVersion = "6.2";
  majorVersion = with lib; (elemAt (take 1 (splitVersion kernelVersion)) 0);
in
  pkgs.buildLinux (args
    // {
      version = kernelVersion;

      pname = "linux-t2";
      modDirVersion = with lib; "${concatStringsSep "." (take 3 (splitVersion "${kernelVersion}.0"))}";

      src = pkgs.fetchurl {
        url = "mirror://kernel/linux/kernel/v${majorVersion}.x/linux-${kernelVersion}.tar.xz";
        hash = "sha256-dIYvqKtA7a6FuzOFwLcf4QMoi85RhSbWMZeACzy97LE=";
      };

      structuredExtraConfig = with lib.kernel; {
        APPLE_BCE = module;
        BT_HCIUART_BCM = yes;
        BT_HCIBCM4377 = module;
        HID_APPLE_TOUCHBAR = module;
        HID_APPLE_MAGIC_BACKLIGHT = module;
      };

      kernelPatches =
        lib.attrsets.mapAttrsToList (file: type: {
          name = file;
          patch = "${patchesRepo}/${file}";
        })
        (lib.attrsets.filterAttrs (file: type: type == "regular" && lib.strings.hasSuffix ".patch" file)
          (builtins.readDir patchesRepo));
    })
  // (args.argsOverride or {})
