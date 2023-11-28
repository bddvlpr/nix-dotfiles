{
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
      TERMINAL = "kitty";
    };
  };

  programs.kitty = {
    enable = true;

    settings = {
      window_padding_width = 8;
    };
  };
}
