{pkgs, ...}: {
  programs.starship = {
    enable = true;

    enableFishIntegration = true;
    enableZshIntegration = true;

    settings =
      {
        format = "$all";
        palette = "catppuccin_macchiato";
        add_newline = false;

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
      }
      // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "starship";
          rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
          hash = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
        }
        + "/palettes/macchiato.toml"));
  };
}
