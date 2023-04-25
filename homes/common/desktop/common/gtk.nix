{ pkgs, inputs, ... }:

{
  gtk = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
  };
  #home.packages = [ pkgs.dconf ];
}
