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
      nil
      sumneko-lua-language-server
      rust-analyzer
    ];

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      presence-nvim
      cmp-nvim-lsp
      nvim-autopairs
      nvim-cmp
      nvim-code-action-menu
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-treesitter
      lualine-nvim
      telescope-nvim
      vim-svelte
      which-key-nvim

      # Treesitter parsers
      nvim-treesitter-parsers.css
      nvim-treesitter-parsers.scss
      nvim-treesitter-parsers.sql
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.yaml
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.svelte
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.json5
    ];

    extraLuaConfig = ''
      vim.wo.number = true
      vim.wo.relativenumber = true
      vim.cmd.colorscheme "catppuccin"
      vim.o.cursorline = true
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
      vim.o.autoindent = "smartindent"

      ${builtins.readFile ./config/nvim-cmp.lua}
      ${builtins.readFile ./config/lualine.lua}
      ${builtins.readFile ./config/lspconfig.lua}
      ${builtins.readFile ./config/treesitter.lua}
    '';
  };

  home.sessionVariables.EDITOR = "nvim";
}
