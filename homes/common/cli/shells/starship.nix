{pkgs, ...}: {
  programs.starship = {
    enable = true;

    enableFishIntegration = true;
    enableZshIntegration = true;

    settings =
      {
        format = "$all";

        character = {
          success_symbol = "[❯](bold mauve)";
          error_symbol = "[❯](bold maroon)";
        };

        os = {
          disabled = false;
          symbols = {
            NixOS = "  ";
          };
        };

        directory.truncation_symbol = "󰄛 /";

        time = {
          disabled = false;
          time_format = "%H:%M";
          style = "bold cyan";
        };

        hostname.style = "bold lavender";

        nix_shell = {
          symbol = " ";
          style = "bold cyan";
        };
      };  };
}
