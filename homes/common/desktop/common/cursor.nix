{pkgs, ...}: {
  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    gtk.enable = true;
  };
}
