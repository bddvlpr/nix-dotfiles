{ inputs, pkgs, ... }:
let
  openVsxExtensions = inputs.nix-vscode-extensions.extensions.${pkgs.system}.open-vsx;
in
{
  programs.vscode = {
    enable = true;

    package = pkgs.vscode;

    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    userSettings = {
      "git.autofetch" = true;
      "editor.formatOnSave" = true;
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

    extensions = with openVsxExtensions; [
      # Theme & flair
      catppuccin.catppuccin-vsc
      leonardssh.vscord

      # Nix(OS)
      bbenoist.nix

      # Svelte(Kit)
      svelte.svelte-vscode
      bradlc.vscode-tailwindcss

      # Databases
      prisma.prisma

      # Misc
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      usernamehw.errorlens
      eamodio.gitlens
      esbenp.prettier-vscode
    ];
  };
}
