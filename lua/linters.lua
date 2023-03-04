local formatters = require("lvim.lsp.null-ls.formatters")

-- disabling tsserver language server formatting capabilities if you are using prettier/prettierd as formatter
lvim.lsp.on_attach_callback = function(client, _)
	if client.name ~= "tsserver" then
		return
	end

	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

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
