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
        ms-kubernetes-tools.vscode-kubernetes-tools
        usernamehw.errorlens
        eamodio.gitlens
        esbenp.prettier-vscode
        github.copilot
        github.vscode-github-actions
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          publisher = "leonardssh";
          name = "vscord";
          version = "5.1.10";
          sha256 = "1nw3zvlw0bx9yih4z3i20irdw02zz444ncf84xjvjn6h5hw47i3x";
        }
      ];
  };
}
