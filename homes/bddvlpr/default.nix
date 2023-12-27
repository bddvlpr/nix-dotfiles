{outputs, ...}: {
  imports = [
    ../common
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "bddvlpr";
    homeDirectory = "/home/bddvlpr";

    persistence."/nix/persist/home/bddvlpr" = {
      directories = ["Documents" "Pictures" "Videos" "Music" "Desktop"];
      allowOther = true;
    };
  };

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
