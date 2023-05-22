{
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      bar = {
        # Configuration & Setup
        layer = "top";
        position = "top";
        modules-left = [ "custom/logo" "wlr/workspaces" /*"tray" "hyprland/window"*/ ];
        modules-right = [ "cpu" "memory" "backlight" "pulseaudio" "pulseaudio#microphone" "network" "battery" "clock" ];

        # Modules
        "custom/logo" = {
          format = "󱄅";
        };

        "hyprland/window" = {
          format = "{}";
        };

        "wlr/workspaces" = {
          all-outputs = true;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        cpu = {
          interval = 1;
          format = "  {}%";
        };

        memory = {
          interval = 1;
          format = "  {}%";
        };

        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-linked = "󰌙 (No IP)";
          format-disconnected = "󰌙";
          format-alt = "󰱓 {ifname}:{essid} {ipaddr}/{cidr}";
          tooltip-format = "{essid} - {ifname} via {gwaddr}";
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
          format-alt = "{: %a, %b %e}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          timezone = "Europe/Brussels";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-right-click = "exec pavucontrol";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
      };
    };
  };
}
