{
  pkgs,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;

    package = let
      vscode = pkgs.vscodium.overrideAttrs (old: {
        preFixup = ''
          gappsWrapperArgs+=(
            --prefix PATH : ${pkgs.glib.bin}/bin
          )
        '';
      });
    in
      vscode.fhsWithPackages (ps: with ps; [dotnet-sdk dotnet-aspnetcore]);

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = with config.stylix.fonts; {
      "git.autofetch" = true;
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.minimap.autohide" = true;
      "editor.minimap.renderCharacters" = false;
      "editor.fontFamily" = monospace.name;
      "extensions.autoUpdate" = false;
      "explorer.autoReveal" = false;
      "explorer.excludeGitIgnore" = true;

      "security.workspace.trust.enabled" = false;

      "workbench.startupEditor" = "none";
      "workbench.tree.indent" = 16;
      "workbench.iconTheme" = "catppuccin-macchiato";
      "workbench.colorTheme" = "Catppuccin Macchiato";

      "omnisharp.useModernNet" = true;

      "typescript.updateImportsOnFileMove.enabled" = "always";

      "gitlens.showWhatsNewAfterUpgrades" = false;
      "gitlens.showWelcomeOnInstall" = false;

      "[aspnetcorerazor]" = {
        "editor.formatOnSave" = false;
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };

    extensions = with pkgs.vscode-extensions;
      [
        # Nix(OS)
        bbenoist.nix
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

        # Python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers

        # Misc
        editorconfig.editorconfig
        ms-azuretools.vscode-docker
        usernamehw.errorlens
        eamodio.gitlens
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint

        # Themeing
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscord";
          publisher = "leonardssh";
          version = "5.2.4";
          sha256 = "sha256-PlBQG7w1ZHj3bedzwxHMW1wNvDotcrEwpHwwjozPwa4=";
        }
      ];
  };
}
