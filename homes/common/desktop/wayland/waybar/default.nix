{
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      bar = {
        # Configuration & Setup
        layer = "top";
        position = "top";
        spacing = 4;
        modules-left = [ "wlr/workspaces" ];
        #modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "backlight" "battery" "clock" ];

        # Modules
        "wlr/workspaces" = {
          all-outputs = true;
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = "{ifname} via {gwaddr}";
          format-linked = " (No IP)";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ " " " " " " " " " " ];
        };

        clock = {
          format = " {:%I:%M%p}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          timezone = "Europe/Brussels";
        };
      };
    };
  };
}
