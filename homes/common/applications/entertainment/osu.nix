{pkgs, ...}: {
  home = {
    packages = with pkgs; [osu-lazer];

    persistence."/nix/persist/home/bddvlpr".directories = [".local/share/osu"];
  };
}
