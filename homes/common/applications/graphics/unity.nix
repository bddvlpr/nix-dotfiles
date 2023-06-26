{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # https://github.com/NixOS/nixpkgs/pull/239850
      (unityhub.override {
        extraLibs = pkgs: [
          xorg.libXi
          xorg.libXrender
          gnome2.GConf
          libcap
        ];
      })
      vrc-get
    ];

    file = {
      ".config/unityhub/projectDir.json".text = ''
        {
          "directoryPath": "/home/bddvlpr/Documents/Unity"
        }
      '';

      ".config/unityhub/secondaryInstallPath.json".text = ''
        "/home/bddvlpr/.local/share/unity3d"
      '';
    };

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/unityhub"
      ".config/unity3d"
      ".local/share/unity3d"
    ];
  };
}
