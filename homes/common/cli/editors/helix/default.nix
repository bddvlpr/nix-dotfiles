{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    enable = true;

    defaultEditor = true;

    extraPackages = with pkgs; [
      # LSP
      netcoredbg
      nil
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      omnisharp-roslyn
      rust-analyzer
    ];

    settings = {
      theme = lib.mkForce "base16_transparent";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
      };
    };

    languages = {
      language = [
        {
          name = "svelte";
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
        }
      ];
    };
  };
}
