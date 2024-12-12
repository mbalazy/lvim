-- disabling tsserver language server formatting capabilities if you are using prettier/prettierd as formatter
-- lvim.lsp.on_attach_callback = function(client, _)
--   if client.name ~= "tsserver" then
--     return
--   end
-- end

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    exe = "prettierd",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "markdown",
      "css",
      "scss",
      "vue",
      "yaml",
      "graphql",
    },
  },
  {
    exe = "fixjson",
    filetypes = {
      "json",
      "jsonc",
    },
  },
  {
    exe = "stylua",
    filetypes = {
      "lua",
    },
  },
  {
    exe = "shfmt",
    filetypes = {
      "sh",
    },
  },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    exe = "jsonlint",
    filetypes = {
      "json",
      "jsonc",
    },
  },
  {
    exe = "eslint_d",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
      "yaml",
    },
  },
})
