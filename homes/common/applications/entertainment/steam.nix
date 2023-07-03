{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      (steam.override
        {
          extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${pkgs.proton-ge-custom}'";
        })
      gamescope
      protontricks
      mangohud
    ];

    persistence."/nix/persist/home/bddvlpr" = {
      allowOther = true;
      directories = [
        ".local/share/Steam"
      ];
    };
  };
}
