{outputs, ...}: {
  imports = [
    ../common
    ../../secrets
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
      directories = ["Documents" "Pictures" "Videos" "Music" "Desktop" "Downloads"];
      allowOther = true;
    };
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
