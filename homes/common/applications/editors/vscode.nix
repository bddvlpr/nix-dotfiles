{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium.overrideAttrs (old: {
      preFixup = ''
        gappsWrapperArgs+=(
          --prefix PATH : ${pkgs.glib.bin}/bin
        )
      '';
    });

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

      "security.workspace.trust.enabled" = false;

      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Catppuccin Macchiato";

      "omnisharp.useModernNet" = false;
    };

    extensions = with pkgs.vscode-extensions; [
      # Theme & flair
      catppuccin.catppuccin-vsc

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
}
