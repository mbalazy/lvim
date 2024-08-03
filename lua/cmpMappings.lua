local cmp = require("cmp")

local cmp_mappings = cmp.mapping.preset.insert({
  -- dont work
  -- ["<Tab>"] = cmp.config.disable,
  -- ['<Tab>'] = vim.NIL,
  ["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
});


cmp_mappings['<Tab>'] = vim.NIL
cmp_mappings['<S-Tab>'] = vim.NIL

cmp.setup({
  mapping = cmp_mappings,
})
