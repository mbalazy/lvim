-- general
vim.cmd("set number relativenumber")

lvim.format_on_save = false

lvim.leader = "space"

lvim.colorscheme = "onedark"
require("onedark").setup({
	style = "deep",
})

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.setup.view.width = 50

-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
-- lvim.builtin.nvimtree.setup.diagnostics.enable = true
-- lvim.builtin.nvimtree.setup.diagnostics.show_on_dirs = false

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.telescope.defaults.prompt_prefix = "❯ "
lvim.builtin.telescope.defaults.selection_caret = ">"
lvim.builtin.telescope.defaults.layout_config.width = 0.9
lvim.builtin.telescope.defaults.file_ignore_patterns = { "NvimTree", "node_modules" }

-- automatically close the tab/vim when nvim-tree is the last window in the tab
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/package.json" } })

require("linters")
require("which")

lvim.plugins = {
	{
		"navarasu/onedark.nvim",
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"p00f/nvim-ts-rainbow",
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "info",
			})
		end,
	},
}

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-Space>"] = cmp.mapping.complete(),
		-- ["<C-e>"] = cmp.mapping.abort(),
		["<C-l>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Right>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})
