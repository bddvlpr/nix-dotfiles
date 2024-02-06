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
      nodePackages."@prisma/language-server"
      omnisharp-roslyn
      rust-analyzer
      jdtls
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
        file-picker = {
          hidden = false;
        };
      };
    };

    languages = {
      language = [
        {
          name = "prisma";
          auto-format = true;
        }
        {
          name = "svelte";
          auto-format = true;
        }
        {
          name = "typescript";
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = ["--stdin-filepath" "file.ts"];
          };
          auto-format = true;
        }
      ];
    };
  };
}
