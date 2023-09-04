{pkgs, ...}: {
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

      "omnisharp.useModernNet" = false;
    };

    extensions = with pkgs.vscode-extensions;
      [
        # Theme & flair
        catppuccin.catppuccin-vsc

        # Nix(OS)
        bbenoist.nix
        arrterian.nix-env-selector
        kamadorueda.alejandra

        # Rust
        rust-lang.rust-analyzer
        tamasfe.even-better-toml

        # Angular
        angular.ng-template

        # Flutter
        dart-code.flutter
        dart-code.dart-code

        # Svelte(Kit)
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss

        # C# (.NET)
        ms-dotnettools.csharp

        # Databases
        prisma.prisma

        # Misc
        editorconfig.editorconfig
        ms-azuretools.vscode-docker
        usernamehw.errorlens
        eamodio.gitlens
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint
        github.copilot
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          publisher = "vunguyentuan";
          name = "vscode-postcss";
          version = "2.0.2";
          sha256 = "1f1m3245714481mdskxz6qslhzd7p1x59rljdcpwqx1p371w5nxn";
        }
        {
          publisher = "tauri-apps";
          name = "tauri-vscode";
          version = "0.2.6";
          sha256 = "03nfyiac562kpndy90j7vc49njmf81rhdyhjk9bxz0llx4ap3lrv";
        }
      ];
  };
}
