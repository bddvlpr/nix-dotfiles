{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default

    ../common
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

  fonts.fontconfig.enable = true;

  home = {
    packages = with pkgs; [
      swaybg
      swayidle
      playerctl
      xdg-utils
      inputs.hyprwm-contrib.packages.${system}.grimblast

      fira-code
      roboto-mono
      twemoji-color-font
      noto-fonts-cjk-sans

      (nerdfonts.override {fonts = ["FiraCode" "RobotoMono" "NerdFontsSymbolsOnly"];})
    ];

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
  });

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.default.override {
      enableXWayland = true;
      hidpiXWayland = true;

      nvidiaPatches = true;
    };

    nvidiaPatches = true;

    xwayland = {
      enable = true;
      hidpi = true;
    };

    extraConfig =
      (import ./config.nix {
        inherit (config) home;
      })
      + (import ./monitors.nix {
        inherit lib;
        inherit (config) monitors;
      });
  };
}
