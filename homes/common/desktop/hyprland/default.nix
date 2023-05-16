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

  home = {
    packages = with pkgs; [
      swaybg
      swayidle

      fira-code
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = 1;
    };
  };

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  });

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig =
      (import ./config.nix { inherit (config) home; }) +
      (import ./monitors.nix { inherit lib; inherit (config) monitors; });
  };
}
