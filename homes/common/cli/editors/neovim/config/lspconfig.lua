local lspconfig = require('lspconfig')
local servers = {"tsserver", "rust_analyzer", "svelte", "nil_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
	globals = { 'vim' },
      },
      workspace = {
	library = vim.api.nvim_get_runtime_file("", true),
	checkThirdParty = false,
      },
      telemetry = {
	enable = false,
      }
    }
  }
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function (ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  end,
})
