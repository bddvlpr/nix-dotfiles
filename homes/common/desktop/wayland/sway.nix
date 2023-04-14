{ config, pkgs, lib, default, ... }:
{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      menu = "wofi";
      #terminal = default.terminal.name;
      #modifier = "Mod4";
      bars = [ ];
    };
  };
}
