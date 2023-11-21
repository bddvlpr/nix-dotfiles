{pkgs, ...}: {
  programs.helix = {
    enable = true;

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
  };
}
