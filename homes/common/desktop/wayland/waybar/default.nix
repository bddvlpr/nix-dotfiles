{
  config,
  pkgs,
  ...
}: let
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  github-cli = "${pkgs.github-cli}/bin/gh";
  jq = "${pkgs.jq}/bin/jq";
  light = "${pkgs.light}/bin/light";
  pamixer = "${pkgs.pamixer}/bin/pamixer";
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
  qjackctl = "${pkgs.qjackctl}/bin/qjackctl";
  xdg-open = "${pkgs.xdg-utils}/bin/xdg-open";

  playerExec = ''
    #!/bin/sh
    current_song="$(${playerctl} metadata --player spotify --format '{{artist}} - {{title}}')"
    if [ -n "$current_song" ]; then
      echo " $current_song"
    else
      echo ""
    fi
  '';
  githubExec = ''
    #!/bin/sh
    current_notifications="$(GH_TOKEN=$(cat ${config.age.secrets.github-notifications.path}) ${github-cli} api notifications)"
    current_count="$(echo $current_notifications | ${jq} '. | map(select(.unread == true)) | length')"
    if [[ !($current_count) || "$current_count" == "0" ]]; then
      echo "󰂜"
    else
      echo "󰅸  $current_count"
    fi
  '';
in {
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      bar = {
        # Configuration & Setup
        layer = "top";
        position = "top";
        output = builtins.map (m: m.name) (builtins.filter (m: !m.noBar) config.monitors);
        modules-left = ["custom/logo" "wlr/workspaces"];
        modules-center = ["custom/player"];
        modules-right = ["tray" "custom/github" "cpu" "memory" "backlight" "pulseaudio" "pulseaudio#microphone" "network" "battery" "clock"];

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
            "1" = "󰎤";
            "2" = "󰎧";
            "3" = "󰎪";
            "4" = "󰎭";
            "5" = "󰎱";
            "6" = "󰎳";
            "7" = "󰎶";
            "8" = "󰎹";
            "9" = "󰎼";
            "urgent" = "󰀧";
            "focused" = "󱗜";
            "default" = "󱗜";
          };
        };

        cpu = {
          interval = 3;
          format = "  {usage}%";
          format-alt = "  {icon}";
          format-icons = ["󰋙" "󰫃" "󰫄" "󰫅" "󰫆" "󰫇" "󰫈"];
        };

        memory = {
          interval = 3;
          format = "  {}%";
          format-alt = "  {icon}";
          format-icons = ["󰋙" "󰫃" "󰫄" "󰫅" "󰫆" "󰫇" "󰫈"];
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
          format-alt = "{icon}";
          format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];

          on-scroll-up = "${light} -A 1";
          on-scroll-down = "${light} -U 1";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-alt = "{icon}";
          format-icons = {
            default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
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
          on-click = "${pamixer} -t";
          on-click-right = "${pavucontrol}";
          on-click-middle = "${qjackctl}";
          on-scroll-up = "${pamixer} -i 5";
          on-scroll-down = "${pamixer} -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = " Muted";
          on-click = "${pamixer} --default-source -t";
          on-click-right = "${pavucontrol}";
          on-click-middle = "${qjackctl}";
          on-scroll-up = "${pamixer} --default-source -i 5";
          on-scroll-down = "${pamixer} --default-source -d 5";
          scroll-step = 5;
        };

        "custom/player" = {
          interval = 2;
          exec = playerExec;
          tooltip = false;
          escape = true;

          on-click = "${playerctl} --player spotify play-pause";
          on-scroll-up = "${playerctl} --player spotify volume 0.1+";
          on-scroll-down = "${playerctl} --player spotify volume 0.1-";
        };

        "custom/github" = {
          interval = 60;
          exec = githubExec;
          tooltip = false;
          escape = true;

          on-click = "${xdg-open} https://github.com/notifications";
        };
      };
    };
  };
}
