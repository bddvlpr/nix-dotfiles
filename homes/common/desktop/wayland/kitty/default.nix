{
  config,
  pkgs,
  ...
}: let
  kitty-xterm = pkgs.writeShellScriptBin "xterm" ''
    ${config.programs.kitty.package}/bin/kitty -1 "$@"
  '';
in {
  home = {
    packages = [kitty-xterm pkgs.kitty-themes];
    sessionVariables = {
      TERMINAL = "kitty -1";
    };
  };

  programs.kitty = {
    enable = true;

    font = {
      name = "RobotoMono Nerd Font";
    };

    settings = {
      window_padding_width = 4;
      background_opacity = "0.9";
    };

    theme = "Catppuccin-Macchiato";
  };
}
