{ pkgs, inputs, ... }:

{
  gtk = {
    enable = true;

    #theme = {
    #  name = "Adwaita-dark";
    #  package = pkgs.gnome.gnome-themes-extra;
    #};

    #font = {
    #  name = "FiraCode Nerd Font";
    #  size = 12;
    #};
  };
}
