{pkgs, ...}: {
  home = {
    packages = with pkgs; [runelite];

    persistence."/nix/persist/home/bddvlpr".directories = [".runelite"];
  };
}
