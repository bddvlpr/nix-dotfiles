{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../wayland
  ];

  programs = {
    fish.loginShellInit = ''
      if test (tty) = "/dev/tty1"
        exec Hyprland &> /dev/null
      end
    '';
    zsh.loginExtra = ''
      if [ "$(tty) = "/dev/tty1" ] then
        exec Hyprland &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty) = "/ev/tty1" ] then
        exec Hyprland &> /dev/null
      fi
    '';
  };

  home = {
    packages = with pkgs; [
      swaybg
      swayidle
      playerctl
      xdg-utils
      pkgs.grimblast
    ];

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    settings = {
      input = {
        follow_mouse = 2;
        sensitivity = 0;
        touchpad = {
          disable_while_typing = true;
          clickfinger_behavior = true;
        };
      };

      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${config.stylix.image} --mode fill"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        cursor_inactive_timeout = 120;

        layout = "dwindle";
        no_cursor_warps = true;
      };

      decoration = {
        rounding = 3;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          new_optimizations = false;
        };
      };

      dwindle = {
        no_gaps_when_only = false;
        preserve_split = true;
      };

      animations = {
        enabled = true;

        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "linear, 0, 0, 1.0, 1.0"
        ];

        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "windowsMove, 1, 4, default"
          "border, 1, 10, default"
          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
          "borderangle, 1, 100, linear, loop"
        ];
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        vfr = true;
      };

      windowrule = [
        "float, file_progress"
        "float, confirm"
        "float, dialog"
        "float, download"
        "float, notification"
        "float, error"
        "float, splash"
        "float, confirmreset"
        "float, title: Open File"
        "float, title:^(Media viewer)$"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture-in-Picture)$"
        "size 40% 40%, title:^(Volume Control)$"
        "move 100%-41% 6%, title:^(Volume Control)$"
      ];

      bind = let
        inherit (config.home.sessionVariables) TERMINAL;

        thunar = "${pkgs.xfce.thunar}/bin/thunar";
        wofi = "${pkgs.wofi}/bin/wofi";
        grimblast = "${pkgs.grimblast}/bin/grimblast";
        light = "${pkgs.light}/bin/light";
        pamixer = "${pkgs.pamixer}/bin/pamixer";
        playerctl = "${pkgs.playerctl}/bin/playerctl";
      in [
        "SUPER, Return, exec, ${TERMINAL}"
        "SUPER SHIFT, Return, exec, ${thunar}"
        "SUPER, Space, exec, ${wofi} -S drun -x 10 -y 10 -W 25% -H 60%"

        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, F, fullscreen,"
        "SUPER SHIFT, Space, togglefloating,"
        "SUPER, P, pseudo,"
        "SUPER, S, togglesplit"

        "SUPER SHIFT, S, exec, ${grimblast} --notify copy area"
        ",Print, exec, ${grimblast} --notify copy active"
        "SHIFT, Print, exec, ${grimblast} --notify copy output"
        "SUPER SHIFT, Print, exec, ${grimblast} --notify copy screen"

        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        "SUPER SHIFT, L, movewindow, mon:+1"
        "SUPER SHIFT, H, movewindow, mon:-1"

        ", XF86MonBrightnessUp, exec, ${light} -A 5"
        ", XF86MonBrightnessDown, exec, ${light} -U 5"

        ", XF86AudioRaiseVolume, exec, ${pamixer} -i 5"
        ", XF86AudioLowerVolume, exec, ${pamixer} -d 5"
        ", XF86AudioMute, exec, ${pamixer} -t"
        "SUPER SHIFT, XF86AudioRaiseVolume, exec, ${pamixer} --default-source -i 5"
        "SUPER SHIFT, XF86AudioLowerVolume, exec, ${pamixer} --default-source -d 5"
        ", XF86AudioMicMute, exec, ${pamixer} --default-source -t"

        ", code:172, exec, ${playerctl} play-pause"
        ", code:173, exec, ${playerctl} previous"
        ", code:171, exec, ${playerctl} next"

        "SUPER CTRL, left, resizeactive, -20 0"
        "SUPER CTRL, right, resizeactive, 20 0"
        "SUPER CTRL, up, resizeactive, 0 -20"
        "SUPER CTRL, down, resizeactive, 0 20"

        "SUPER, g, togglegroup"
        "SUPER, tab, changegroupactive"

        "SUPER, a, togglespecialworkspace"
        "SUPER SHIFT, a, movetoworkspace, special"
        "SUPER, c, exec, hyprctl dispatch centerwindow"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"

        "SUPER ALT, up, workspace, e+1"
        "SUPER ALT, down, workspace, e-1"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };

    extraConfig = import ./monitors.nix {
      inherit lib;
      inherit (config) monitors;
    };
  };
}
