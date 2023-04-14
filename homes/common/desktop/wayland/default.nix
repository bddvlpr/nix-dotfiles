{ pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./mako.nix
    #./sway.nix
    ./wofi.nix
  ];

  home = {
    packages = with pkgs; [
      grim
      imv
      mimeo
      waypipe
      slurp
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
