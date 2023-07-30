{pkgs, ...}: let
  proton-ge-custom = pkgs.callPackage ./proton-ge-custom.nix {};
in {
  home = {
    packages = with pkgs; [
      (steam.override
        {
          extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${proton-ge-custom}'";
        })
      steam-run
      gamescope
      protontricks
      mangohud
      proton-ge-custom
    ];

    persistence."/nix/persist/home/bddvlpr" = {
      allowOther = true;
      directories = [
        ".factorio"
        ".local/share/Steam"
      ];
    };
  };
}
