-- Setup formatters for JavaScript family
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettierd",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"json",
			"markdown",
		},
	},
})

-- ESLint
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
		},
	},
})

-- Setup linters for css/html
lvim.lang.css.formatters = { { exe = "prettierd" } }
lvim.lang.html.formatters = lvim.lang.css.formatters
lvim.lang.scss = lvim.lang.css

lvim.lang.json.formatters = { { exe = "prettierd" } }
-- lvim.lang.json.formatters = { { exe = 'json_tool│prettierd│prettier' } }
lvim.lang.lua.formatters = { { exe = "stylua" } }
