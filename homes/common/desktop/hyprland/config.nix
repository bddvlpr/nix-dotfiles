{ home }:
let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR;
in
''
  input {
    kb_layout=be
    follow_mouse = 1
    sensitivity = 0
    touchpad {
      disable_while_typing=false
    }
  }

  exec-once=waybar
  #exec=swaybg -i #$#{wallpaper} --mode fill
  exec-once=mako
  exec-once=swayidle -w

  general {
    gaps_in = 5
    gaps_out = 5
    border_size = 1
    col.active_border = 0xFF7D4045
    col.inactive_border = 0xFF382D2E
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
    rounding = 0
    multisample_edges = true

    active_opacity = 1.0
    inactive_opacity = 0.7

    blur = false
    blur_size = 3
    blur_passes = 3
    blur_new_optimizations = true

    drop_shadow = true
    shadow_ignore_window = true
    shadow_offset = 1 2
    shadow_range = 10
    shadow_render_power = 2
    col.shadow = 0x66404040

    blurls = waybar
  }

  animations {
    enabled = true

    bezier = overshot, 0.05, 0.9, 0.1, 1.05
    bezier = smoothOut, 0.36, 0, 0.66, -0.56
    bezier = smoothIn, 0.25, 1, 0.5, 1

    animation = windows, 1, 5, overshot, slide
    animation = windowsOut, 1, 4, smoothOut, slide
    animation = windowsMove, 1, 4, default
    animation = border, 1, 10, default
    animation = fade, 1, 10, smoothIn
    animation = fadeDim, 1, 10, smoothIn
    animation = workspaces, 1, 6, default
  }

  dwindle {
    no_gaps_when_only = false
    pseudotile = true
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
  windowrule = float, file-roller
  windowrule = float, title:DevTools
  windowrule = fullscreen, wlogout
  windowrule = idleinhibit focus, mpv
  windowrule = idleinhibit fullscreen, firefox
  windowrule = float, title:^(Media viewer)$
  windowrule = float, title:^(Volume Control)$
  windowrule = float, title:^(Picture-in-Picture)$
  windowrule = size 800 600, title:^(Volume Control)$
  windowrule = move 75 44%, title:^(Volume Control)$
  windowrule = opacity 0.92, Thunar

  bind = SUPER, Return, exec, ${TERMINAL}

  bind = SUPER, Q, killactive,
  bind = SUPERSHIFT, Q, exit,
  bind = SUPER, F, fullscreen,
  bind = SUPER, Space, togglefloating,
  bind = SUPER, P, pseudo,
  bind = SUPER, S, togglesplit,

  bind = SUPER, h, movefocus, l
  bind = SUPER, l, movefocus, r
  bind = SUPER, k, movefocus, u
  bind = SUPER, j, movefocus, d

  bind = SUPER CTRL, left, resizeactive, -20 0
  bind = SUPER CTRL, right, resizeactive, 20 0
  bind = SUPER CTRL, up, resizeactive, 0 -20
  bind = SUPER CTRL, down, resizeactive, 0 20

  bind = SUPER, g, togglegroup
  bind = SUPER, tab, changegroupactive

  bind = SUPER, a, togglespecialworkspace
  bind = SUPERSHIFT, a, movetoworkspace, special
  bind = SUPER, c, exec, hyprctl dispatch centerwindow

  bind = SUPER, 1, workspace, 1
  bind = SUPER, 2, workspace, 2
  bind = SUPER, 3, workspace, 3
  bind = SUPER, 4, workspace, 4
  bind = SUPER, 5, workspace, 5
  bind = SUPER, 6, workspace, 6
  bind = SUPER, 7, workspace, 7
  bind = SUPER, 8, workspace, 8
  bind = SUPER, 9, workspace, 9
  bind = SUPER, 0, workspace, 10
  bind = SUPER ALT, up, workspace, e+1
  bind = SUPER ALT, down, workspace, e-1

  bind = SUPERSHIFT, 1, movetoworkspace, 1
  bind = SUPERSHIFT, 2, movetoworkspace, 2
  bind = SUPERSHIFT, 3, movetoworkspace, 3
  bind = SUPERSHIFT, 4, movetoworkspace, 4
  bind = SUPERSHIFT, 5, movetoworkspace, 5
  bind = SUPERSHIFT, 6, movetoworkspace, 6
  bind = SUPERSHIFT, 7, movetoworkspace, 7
  bind = SUPERSHIFT, 8, movetoworkspace, 8
  bind = SUPERSHIFT, 9, movetoworkspace, 9
  bind = SUPERSHIFT, 0, movetoworkspace, 10

  bindm = SUPER, mouse:272, movewindow
  bindm = SUPER, mouse:273, resizewindow
  bind = SUPER, mouse_down, workspace, e+1
  bind = SUPER, mouse_up, workspace, e-1
''
