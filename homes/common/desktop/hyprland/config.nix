{home}: let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR;
in ''
  input {
    kb_layout=be
    follow_mouse = 2
    sensitivity = 0
    touchpad {
      disable_while_typing=false
    }
  }

  exec-once=waybar
  exec=swaybg -i ${./wallpapers/starrynight.png} --mode fill
  #exec-once=mako
  #exec-once=swayidle -w

  general {
    gaps_in = 4
    gaps_out = 8
    border_size = 2
    cursor_inactive_timeout = 120

    col.active_border = rgb(c6a0f6) rgb(ed8796) rgb(ee99a0) rgb(f5a97f) rgb(eed49f) rgb(a6da95) rgb(91d7e3) rgb(7dc4e4) rgb(8aadf4) rgb(b7bdf8) 45deg
    col.inactive_border = rgb(181926)

    col.group_border = rgb(181926)
    col.group_border_active = rgb(c6a0f6) rgb(ed8796) rgb(ee99a0) rgb(f5a97f) rgb(eed49f) rgb(a6da95) rgb(91d7e3) rgb(7dc4e4) rgb(8aadf4) rgb(b7bdf8) 45deg

    layout = dwindle
    no_cursor_warps = true
  }

  misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    mouse_move_enables_dpms = true
    vfr = true
  }

  decoration {
    rounding = 3
    multisample_edges = true

    active_opacity = 1.0
    inactive_opacity = 1.0

    blur = false
    blur_size = 3
    blur_passes = 1
    blur_new_optimizations = true

    drop_shadow = true
    #shadow_ignore_window = true
    #shadow_offset = 1 2
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)

    blurls = waybar
  }

  animations {
    enabled = true

    bezier = overshot, 0.05, 0.9, 0.1, 1.05
    bezier = smoothOut, 0.36, 0, 0.66, -0.56
    bezier = smoothIn, 0.25, 1, 0.5, 1
    bezier = linear, 0, 0, 1.0, 1.0

    animation = windows, 1, 5, overshot, slide
    animation = windowsOut, 1, 4, smoothOut, slide
    animation = windowsMove, 1, 4, default
    animation = border, 1, 10, default
    animation = fade, 1, 10, smoothIn
    animation = fadeDim, 1, 10, smoothIn
    animation = workspaces, 1, 6, default
    animation = borderangle, 1, 100, linear, loop
  }

  dwindle {
    no_gaps_when_only = false
    preserve_split = true
  }

  windowrule = float, file_progress
  windowrule = float, confirm
  windowrule = float, dialog
  windowrule = float, download
  windowrule = float, notification
  windowrule = float, error
  windowrule = float, splash
  windowrule = float, confirmreset
  windowrule = float, title: Open File
  windowrule = float, title:branchdialog
  windowrule = float, Lxappearance
  windowrule = float, Rofi
  windowrule = animation none, Rofi
  windowrule = float, viewnior
  windowrule = float, Viewnior
  windowrule = float, feh
  windowrule = float, pavucontrol-qt
  windowrule = float, pavocontrol
  windowrule = float, qjackctl
  windowrule = float, file-roller
  windowrule = float, title:DevTools
  windowrule = fullscreen, wlogout
  windowrule = idleinhibit focus, mpv
  windowrule = idleinhibit fullscreen, firefox
  windowrule = float, title:(Sharing Indicator)$
  windowrule = size 300 300, title:(Sharing Indicator)$
  windowrule = float, title:^(Media viewer)$
  windowrule = float, title:^(Volume Control)$
  windowrule = float, title:^(Picture-in-Picture)$
  windowrule = size 40% 40%, title:^(Volume Control)$
  windowrule = move 100%-41% 6%, title:^(Volume Control)$
  windowrule = opacity 0.92, Thunar

  bind = SUPER, Return, exec, ${TERMINAL}
  bind = SUPER, Space, exec, wofi -S drun -x 10 -y 10 -W 25% -H 60%

  bind = SUPER, Q, killactive,
  bind = SUPER SHIFT, Escape, exit,
  bind = SUPER, F, fullscreen,
  bind = SUPER SHIFT, Space, togglefloating,
  bind = SUPER, P, pseudo,
  bind = SUPER, S, togglesplit,

  bind = SUPER SHIFT, S, exec, grimblast --notify copy area
  bind = ,Print, exec, grimblast --notify copy active
  bind = SHIFT, Print, exec, grimblast --notify copy output
  bind = SUPER SHIFT, Print, exec, grimblast --notify copy screen

  bind = SUPER, Left, movefocus, l
  bind = SUPER, Right, movefocus, r
  bind = SUPER, Up, movefocus, u
  bind = SUPER, Down, movefocus, d

  bind = SUPER SHIFT, Left, movewindow, mon:+1
  bind = SUPER SHIFT, Right, movewindow, mon:-1

  bind = , XF86MonBrightnessUp, exec, light -A 5
  bind = , XF86MonBrightnessDown, exec, light -U 5

  bind = , XF86AudioRaiseVolume, exec, pamixer -i 5
  bind = , XF86AudioLowerVolume, exec, pamixer -d 5
  bind = , XF86AudioMute, exec, pamixer -t
  bind = SUPER SHIFT, XF86AudioRaiseVolume, exec, pamixer --default-source -i 5
  bind = SUPER SHIFT, XF86AudioLowerVolume, exec, pamixer --default-source -d 5
  bind = , XF86AudioMicMute, exec, pamixer --default-source -t

  bind = , code:172, exec, playerctl play-pause
  bind = , code:173, exec, playerctl previous
  bind = , code:171, exec, playerctl next

  bind = SUPER CTRL, left, resizeactive, -20 0
  bind = SUPER CTRL, right, resizeactive, 20 0
  bind = SUPER CTRL, up, resizeactive, 0 -20
  bind = SUPER CTRL, down, resizeactive, 0 20

  bind = SUPER, g, togglegroup
  bind = SUPER, tab, changegroupactive

  bind = SUPER, a, togglespecialworkspace
  bind = SUPER SHIFT, a, movetoworkspace, special
  bind = SUPER, c, exec, hyprctl dispatch centerwindow

  bind = SUPER, ampersand, workspace, 1
  bind = SUPER, eacute, workspace, 2
  bind = SUPER, quotedbl, workspace, 3
  bind = SUPER, apostrophe, workspace, 4
  bind = SUPER, parenleft, workspace, 5
  bind = SUPER, section, workspace, 6
  bind = SUPER, egrave, workspace, 7
  bind = SUPER, exclam, workspace, 8
  bind = SUPER, ccedilla, workspace, 9
  #bind = SUPER, agrave, workspace, 10
  bind = SUPER ALT, up, workspace, e+1
  bind = SUPER ALT, down, workspace, e-1

  bind = SUPER SHIFT, ampersand, movetoworkspace, 1
  bind = SUPER SHIFT, eacute, movetoworkspace, 2
  bind = SUPER SHIFT, quotedbl, movetoworkspace, 3
  bind = SUPER SHIFT, apostrophe, movetoworkspace, 4
  bind = SUPER SHIFT, parenleft, movetoworkspace, 5
  bind = SUPER SHIFT, section, movetoworkspace, 6
  bind = SUPER SHIFT, egrave, movetoworkspace, 7
  bind = SUPER SHIFT, exclam, movetoworkspace, 8
  bind = SUPER SHIFT, ccedilla, movetoworkspace, 9
  bind = SUPER SHIFT, agrave, movetoworkspace, 10

  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow
  bind = SUPER, mouse_down, workspace, e+1
  bind = SUPER, mouse_up, workspace, e-1

  monitor = , highrr, auto, 1
''
