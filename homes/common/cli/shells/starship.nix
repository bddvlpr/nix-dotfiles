{
  programs.starship = {
    enable = true;

    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      format = "$all";

      os = {
        disabled = false;
        symbols = {
          NixOS = " ";
        };
      };

      directory.truncation_symbol = "󰄛 /";

      time = {
        disabled = false;
        time_format = "%H:%M";
        style = "bold cyan";
      };

      nix_shell = {
        symbol = " ";
        style = "bold cyan";
      };
    };
  };
}
