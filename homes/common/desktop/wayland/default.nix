{pkgs, ...}: {
  imports = [
    ./kitty
    ./mako
    ./waybar
    ./wofi
  ];

  home = {
    packages = with pkgs; [
      grim
      imv
      mpv
      mimeo
      waypipe
      slurp
      xfce.thunar
      wf-recorder
      wl-clipboard
      wl-mirror
      ydotool
    ];

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      QT_QPA_PLATFORM = "wayland";
      LIBSEAT_BACKEND = "logind";
    };
  };
}
