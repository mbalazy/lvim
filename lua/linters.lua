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
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
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
