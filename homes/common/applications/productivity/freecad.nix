{pkgs, ...}: {
  home = {
    packages = with pkgs; [freecad];

    persistence."/nix/persist/home/bddvlpr".directories = [".local/share/FreeCAD" ".config/FreeCAD"];
  };
}
