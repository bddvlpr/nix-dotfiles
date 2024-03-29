{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = false;
    withNodeJs = false;
    withRuby = false;

    extraPackages = with pkgs; [
      # Tools
      fd
      gcc
      ripgrep
      tree-sitter

      # LSP
      nodePackages_latest.typescript-language-server
      nodePackages_latest.svelte-language-server
      nodePackages_latest.vscode-langservers-extracted
      nil
      sumneko-lua-language-server
      rust-analyzer
      docker-compose-language-service
      omnisharp-roslyn
    ];

    plugins = with pkgs.vimPlugins; [
      cmp-nvim-lsp
      copilot-vim
      gitsigns-nvim
      lualine-nvim
      luasnip
      nvim-autopairs
      nvim-cmp
      nvim-code-action-menu
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-tree-lua
      nvim-treesitter
      nvim-ts-autotag
      nvim-web-devicons
      presence-nvim
      telescope-nvim
      trouble-nvim
      vim-svelte
      which-key-nvim

      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.c_sharp
      nvim-treesitter-parsers.scss
      nvim-treesitter-parsers.sql
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.svelte
      nvim-treesitter-parsers.prisma
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.json5
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config/general.lua}
      ${builtins.readFile ./config/gitsigns.lua}
      ${builtins.readFile ./config/lspconfig.lua}
      ${builtins.readFile ./config/lualine.lua}
      ${builtins.readFile ./config/nvim-autopairs.lua}
      ${builtins.readFile ./config/nvim-cmp.lua}
      ${builtins.readFile ./config/nvim-tree.lua}
      ${builtins.readFile ./config/telescope.lua}
      ${builtins.readFile ./config/treesitter.lua}
    '';
  };

  home = {
    persistence."/nix/persist/home/bddvlpr".directories = [".config/github-copilot"];
  };
}
