{ outputs, config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    style = builtins.readFile ./style/waybar.css;

    settings = {
      primary = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;

        modules-left = [
          "clock"
          "wlr/workspaces"
        ];

        modules-center = [ "hyprland/window" ];

        modules-right = [
          "tray"
          "pulseaudio"
          "pulseaudio#microphone"
        ];

        "hyprland/window" = {
          format = "{}";
        };

        "wlr/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          all-outputs = true;
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            active = "";
            default = "";
          };
        };
        tray = {
          icon-size = 13;
          tooltip = false;
          spacing = 10;
        };

        clock = {
          format = "{: %R   %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };
  };
}
