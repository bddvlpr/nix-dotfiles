{ outputs, config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        height = 40;
        margin = "6";
        position = "top";
      };
    };
  };
}
