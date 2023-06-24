{
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = {
      "git.autofetch" = true;
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.minimap.autohide" = true;
      "editor.minimap.renderCharacters" = false;
      "extensions.autoUpdate" = false;
      "explorer.autoReveal" = false;

      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Catppuccin Macchiato";

      "vscord.status.problems.text" = "{problems_count} issues";

      "vscord.status.state.text.viewing" = "{folder_and_file} [{current_line}:{line_count}]";
      "vscord.status.state.text.editing" = "{folder_and_file} [{current_line}:{line_count}]";
      "vscord.status.state.text.debugging" = "{folder_and_file} [{current_line}:{line_count}]";

      "vscord.status.details.idle.enabled" = false;
      "vscord.status.details.text.idle" = "Idling 💤";
      "vscord.status.details.text.editing" = "{workspace} ({problems})";
      "vscord.status.details.text.debugging" = "{workspace} ({problems})";

      "vscord.status.idle.check" = false;
    };

    extensions = with pkgs.vscode-extensions;
      [
        # Theme & flair
        catppuccin.catppuccin-vsc

        # Nix(OS)
        bbenoist.nix
        kamadorueda.alejandra

        # Rust
        rust-lang.rust-analyzer

        # Flutter
        dart-code.flutter
        dart-code.dart-code

        # Svelte(Kit)
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss

        # Databases
        prisma.prisma

        # Misc
        editorconfig.editorconfig
        ms-azuretools.vscode-docker
        usernamehw.errorlens
        eamodio.gitlens
        esbenp.prettier-vscode
        github.copilot
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          publisher = "leonardssh";
          name = "vscord";
          version = "5.1.11";
          sha256 = "1c9037ca15f2006mkc2skvv70zvp29ys7askir1xg8mrjglissiq";
        }
        {
          publisher = "vunguyentuan";
          name = "vscode-postcss";
          version = "2.0.2";
          sha256 = "1f1m3245714481mdskxz6qslhzd7p1x59rljdcpwqx1p371w5nxn";
        }
      ];
  };
}
