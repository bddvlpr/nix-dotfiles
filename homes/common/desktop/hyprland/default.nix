{ inputs, lib, config, pkgs, ... }:

{
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

  home.packages = with pkgs; [
    swaybg
    swayidle

    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  });

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    # TODO: monitors
    extraConfig = (import ./config.nix {
      inherit (config) home;
    });
  };
}
