{ config, pkgs, ... }:

let
  playerExec = ''
    #!/bin/sh
    current_song="$(${pkgs.playerctl}/bin/playerctl metadata --format '{{artist}} - {{title}}')"
    if [ -n "$current_song" ]; then
        echo " $current_song"
    else
        echo ""
    fi
  '';

in
{
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      bar = {
        # Configuration & Setup
        layer = "top";
        position = "top";
        output = builtins.map (m: m.name) (builtins.filter (m: !m.noBar) config.monitors);
        modules-left = [ "custom/logo" "wlr/workspaces" /*"tray" "hyprland/window"*/ ];
        modules-center = [ "custom/player" ];
        modules-right = [ "tray" "cpu" "memory" "backlight" "pulseaudio" "pulseaudio#microphone" "network" "battery" "clock" ];

        # Modules
        "custom/logo" = {
          format = "󱄅";
          tooltip = false;
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
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        cpu = {
          interval = 3;
          format = "  {usage}%";
        };

        memory = {
          interval = 3;
          format = "  {}%";
          tooltip-format = "{used:0.1f}GiB/{total:0.1f}GiB total ({swapUsed:0.1f}GiB/{swapAvail:0.1f}GiB swap)";
        };

        network = {
          interval = 3;
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-linked = "󰌙 (No IP)";
          format-disconnected = "󰌙";
          format-alt = "󰛴 {bandwidthDownBits} 󰛶 {bandwidthUpBits}";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
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

        "custom/player" = {
          interval = 2;
          exec = playerExec;
          tooltip = false;
          escape = true;

          on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
          on-scroll-up = "${pkgs.playerctl}/bin/playerctl volume 0.1+";
          on-scroll-down = "${pkgs.playerctl}/bin/playerctl volume 0.1-";
        };
      };
    };
  };
}
