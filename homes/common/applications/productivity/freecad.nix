{pkgs, ...}: {
  home = {
    # TODO: awaiting PR https://github.com/NixOS/nixpkgs/pull/263599
    #packages = with pkgs; [freecad];

    persistence."/nix/persist/home/bddvlpr".directories = [".local/share/FreeCAD" ".config/FreeCAD"];
  };
}
