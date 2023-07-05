local cmp = require("cmp")
cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-Space'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping({}),
  })
}
