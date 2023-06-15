{
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [runelite];

    persistence."/nix/persist/home/bddvlpr".directories = [".runelite"];
  };

  xdg.desktopEntries = {
    "runelite.desktop" = {
      name = "RuneLite (NVIDIA-Offload)";
      comment = "RuneLite client for Old School RuneScape";
      exec = "nvidia-offload ${pkgs.runelite}/bin/runelite";
      icon = "${pkgs.runelite.icon}";
      terminal = false;
      categories = ["Game"];
    };
  };
}
