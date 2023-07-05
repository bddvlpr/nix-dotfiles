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
    ];

    extraLuaConfig = ''
      vim.wo.number = true
      vim.wo.relativenumber = true
      vim.cmd.colorscheme "catppuccin"

      ${builtins.readFile ./config/lualine.lua}
      ${builtins.readFile ./config/lspconfig.lua}
    '';
  };

  home.sessionVariables.EDITOR = "nvim";
}
