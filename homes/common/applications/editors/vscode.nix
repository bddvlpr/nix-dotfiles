{pkgs, ...}: {
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

    userSettings = {
      "git.autofetch" = true;
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.minimap.autohide" = true;
      "editor.minimap.renderCharacters" = false;
      "extensions.autoUpdate" = false;
      "explorer.autoReveal" = false;
      "explorer.excludeGitIgnore" = true;

      "security.workspace.trust.enabled" = false;

      "workbench.startupEditor" = "none";
      "workbench.tree.indent" = 16;

      "omnisharp.useModernNet" = true;

      "[aspnetcorerazor]" = {
        "editor.formatOnSave" = false;
      };
    };

    extensions = with pkgs.vscode-extensions; [
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

      # Databases
      prisma.prisma

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
      github.copilot
    ];
  };

  home.file.".vscode-oss/argv.json" = {
    force = true;
    text = ''
      {
         "enable-crash-reporter": false,
         "password-store": "gnome"
      }
    '';
  };
}
